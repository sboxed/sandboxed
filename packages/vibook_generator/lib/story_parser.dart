import 'package:analyzer/dart/ast/ast.dart' hide Expression;
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:vibook_generator/exception/unsupported_parameters.dart';
import 'package:vibook_generator/parsers/meta_parser.dart';
import 'package:vibook_generator/parsers/type_checker.dart';
import 'package:vibook_generator/ui/unsupported_parameters_message.dart';

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

    Expression story = refer(element.name, element.library.location!.encoding);
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
    Expression widget = refer(element.name, element.library.location!.encoding);
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

Expression? buildParameter(ParameterElement parameter) {
  Expression param(String type, dynamic code) {
    Expression? value = parameter.defaultValueCode != null
        ? CodeExpression(Code(parameter.defaultValueCode!))
        : null;

    if (code is! Raw) {
      value ??= literal(code);
    } else if (code case Expression expression) {
      value ??= expression;
    } else {
      value ??= CodeExpression(Code(code.value.toString()));
    }

    return refer('params').property(type).call([
      literal(parameter.name),
      value,
    ]);
  }

  final colorChecker = TypeChecker.fromUrl('dart:ui#Color');

  final Expression value = switch (parameter.type) {
    DartType type when type.isDartCoreString => param('string', 'Text'),
    DartType type when type.isDartCoreBool => param('boolean', false),
    DartType type when colorChecker.isAssignableFromType(type) =>
      param('color', Raw('Colors.red')),
    _ => param('dynamic\$', defaultValueForType(parameter.type)),
  };

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
    DartType type when type.isDartCoreSet => <dynamic>{},
    DartType type when type.isDartCoreString => '',
    _ => defaultValueForFlutterType(type),
  };
}

dynamic defaultValueForFlutterType(DartType type) {
  if (TypeChecker.fromName('Widget', packageName: 'flutter')
      .isAssignableFromType(type)) {
    return Raw('const SizedBox.shrink()');
  }

  return throw UnsupportedParameterException(type.getDisplayString());
}
