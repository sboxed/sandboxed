import 'package:analyzer/dart/ast/ast.dart' hide Expression;
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed_generator/exception/unsupported_parameters.dart';
import 'package:sandboxed_generator/parsers/meta_parser.dart';
import 'package:sandboxed_generator/parsers/type_checker.dart';
import 'package:sandboxed_generator/ui/unsupported_parameters_message.dart';

extension on Element {
  String? get url {
    return library?.location!.components.first;
  }
}

extension on DartType {
  String? get url {
    return (alias?.element ?? element)?.url;
  }
}

class StoryParser {
  final Resolver resolver;
  final MetaDescription? meta;

  StoryParser({
    required this.resolver,
    required this.meta,
  });

  Future<Expression> parse(TopLevelVariableElement element) async {
    Map<String, Expression> generated = {};

    generated['name'] = literal(
      element.name.replaceAll(RegExp(r'^\$'), '').titleCase,
    );

    if (meta?.widget != null) {
      generated['builder'] = Method(
        (method) {
          method.requiredParameters.addAll([
            Parameter((param) => param.name = 'context'),
            Parameter((param) => param.name = 'params'),
          ]);
          method.lambda = true;
          method.body = buildComponent(meta!.widget!).code;
        },
      ).closure;
    }

    Expression story = refer(
      element.name,
      element.url,
    );

    if (generated.isNotEmpty) {
      story = story.property('applyGenerated').call(
        [],
        {
          for (final item in generated.entries) //
            item.key: item.value,
        },
      );
    }

    return story;
  }
}

class StoryCopyWithBuilder extends RecursiveAstVisitor {
  final overrides = <String>{};

  @override
  visitArgumentList(ArgumentList node) {
    if (node.parent case MethodInvocation parent) {
      if (parent.methodName.name == 'Story') {
        if (!node.arguments
            .whereType<NamedExpression>()
            .any((element) => element.name.label.name == 'builder')) {
          overrides.add('builder');
        }
      }
    }

    return super.visitArgumentList(node);
  }
}

Expression buildComponent(ClassElement element) {
  final constructor = element.constructors.first;
  final constructorName =
      constructor.name.isNotEmpty ? '.${constructor.name}' : '';

  try {
    Expression widget = refer(
      element.name,
      element.url,
    );

    if (constructorName.isNotEmpty) {
      widget.property(constructorName);
    }

    final (positional, named) = buildParameters(constructor.parameters);
    return widget.call(positional, named);
  } on UnsupportedParametersException catch (e) {
    return CodeExpression(
        Code(UnsupportedParametersMessage(parameters: e.parameters).build()));
  }
}

(List<Expression>, Map<String, Expression>) buildParameters(
  List<ParameterElement> parameters,
) {
  final positional = <Expression>[];
  final named = <String, Expression>{};
  final unsupported = <String, String>{};

  for (final parameter in parameters) {
    try {
      final value = buildParameter(parameter);
      if (value == null) continue;

      if (parameter.isNamed) {
        named[parameter.name] = value;
      } else {
        positional.add(value);
      }
    } on UnsupportedParameterException catch (e) {
      unsupported[parameter.name] = e.type;
    }
  }

  if (unsupported.isNotEmpty) {
    throw UnsupportedParametersException(unsupported);
  }

  return (positional, named);
}

Reference buildTypeReference(DartType type) {
  return TypeReference(
    (b) {
      final typeArgs = type.alias?.typeArguments;
      b.url = type.url;
      b.symbol = switch (type) {
        DartType(:final alias) when alias != null => alias.element.name,
        _ => type.getDisplayString(withNullability: false),
      };
      for (final childType in typeArgs ?? <DartType>[]) {
        b.types.add(buildTypeReference(childType));
      }
    },
  );
}

Expression? buildParameter(ParameterElement parameter) {
  Expression param(
    dynamic type,
    dynamic code, {
    List<Expression> positionalArgs = const [],
    Map<String, Expression> namedArgs = const {},
  }) {
    Expression? value;

    if (parameter.defaultValueCode case String defaultValue) {
      if (parameter.type.element case EnumElement enum$) {
        value = handleEnumDefaultValue(defaultValue, enum$, value);
      } else {
        value = CodeExpression(Code(parameter.defaultValueCode!));
      }
    }

    if (code case Raw code) {
      value ??= CodeExpression(Code(code.value.toString()));
    } else if (code case Expression expression) {
      value ??= expression;
    } else if (code != null) {
      value ??= literal(code);
    }

    final param = switch (type) {
      String internal => refer('params') //
            .property(internal)
            .call(
          [literalString(parameter.name, raw: true), ...positionalArgs],
          namedArgs,
        ),
      DartType type => refer('params') //
          .property('dynamic\$')
          .call(
            [literalString(parameter.name, raw: true), ...positionalArgs],
            namedArgs,
            [buildTypeReference(type)],
          ),
      Object() => throw UnimplementedError(),
      null => throw UnimplementedError(),
    };

    if (parameter.isOptional && parameter.defaultValueCode == null) {
      return param.property('optional').call([literal(null)]);
    } else {
      if (value == null) {
        return param.property('default\$').call([]);
      } else {
        return param.property('required').call([value]);
      }
    }
  }

  final colorChecker = TypeChecker.fromUrl('dart:ui#Color');
  final dateChecker = TypeChecker.fromUrl('dart:core#DateTime');
  final durationChecker = TypeChecker.fromUrl('dart:core#Duration');
  final gradientChecker =
      TypeChecker.fromName('Gradient', packageName: 'flutter');

  final Expression value = switch (parameter.type) {
    DartType type when type.isDartCoreString => param('string', 'Text'),
    DartType type when type.isDartCoreBool => param('boolean', false),
    DartType type when type.isDartCoreNum => param('number', 0.0),
    DartType type when type.isDartCoreDouble => param('number', 0.0),
    DartType type when type.isDartCoreInt => param('integer', 0),
    DartType type when type.element is EnumElement => param(
        'single',
        refer(
          type.element!.name!,
          type.url,
        ).property('values').property('first'),
        positionalArgs: [
          refer(
            type.element!.name!,
            type.url,
          ).property('values')
        ],
      ),
    DartType type when colorChecker.isAssignableFromType(type) =>
      param('color', Raw('Colors.red')),
    DartType type when dateChecker.isAssignableFromType(type) =>
      param('datetime', Raw('DateTime.now()')),
    DartType type when durationChecker.isAssignableFromType(type) =>
      param('duration', Raw('Duration.zero')),
    DartType type when gradientChecker.isAssignableFromType(type) => param(
        'gradient',
        Raw("LinearGradient(colors: [Colors.black, Colors.white])"),
      ),
    _ => param(
        parameter.type,
        defaultValueForType(parameter.type),
      ),
  };

  return value;
}

Expression? handleEnumDefaultValue(
    String defaultValue, EnumElement enum$, Expression? value) {
  if (defaultValue.startsWith('${enum$.name}.')) {
    final parts = defaultValue.split('.').skip(1);
    value = refer(enum$.name, enum$.library.location!.components.first);
    for (final part in parts) {
      value = value!.property(part);
    }
  }
  return value;
}

class Raw<T> {
  final T value;

  Raw(this.value);
}

dynamic defaultValueForType(DartType type) {
  if (type.nullabilitySuffix == NullabilitySuffix.question) {
    return null;
  }

  return switch (type) {
    DartType type when type.isDartAsyncFuture => Raw('Future.value()'),
    DartType type when type.isDartAsyncFutureOr => Raw('Future.value()'),
    DartType type when type.isDartAsyncStream => Raw('Stream.empty()'),
    DartType type when type.isDartCoreBool => false,
    DartType type when type.isDartCoreDouble => 0.0,
    DartType type when type.isDartCoreInt => 0,
    DartType type when type.isDartCoreIterable => [],
    DartType type when type.isDartCoreList => [],
    DartType type when type.isDartCoreMap => {},
    DartType type when type.isDartCoreNum => 0,
    DartType type when type.isDartCoreSet => {},
    DartType type when type.isDartCoreString => '',
    _ => defaultValueForFlutterType(type),
  };
}

dynamic defaultValueForFlutterType(DartType type) {
  if (TypeChecker.fromName('Widget', packageName: 'flutter')
      .isAssignableFromType(type)) {
    return Raw('const SizedBox.shrink()');
  }

  return null;
}
