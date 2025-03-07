import 'package:analyzer/dart/ast/ast.dart';
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

  Future<String> parse(TopLevelVariableElement element) async {
    List<String> generated = [];

    generated.add(
      "name: '${element.name.replaceAll(RegExp(r'^\$'), '').titleCase}'",
    );

    if (meta?.widget != null) {
      generated.add(
        'builder: (context, params) => ' //
        '${buildComponent(meta!.widget!)}',
      );
    }

    return element.name +
        (generated.isNotEmpty
            ? '.applyGenerated(${generated.join(',')},)'
            : '');
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

Code buildComponent(ClassElement element) {
  final constructor = element.constructors.first;
  final constructorName =
      constructor.name.isNotEmpty ? '.${constructor.name}' : '';

  try {
    final parameters = buildParameters(constructor.parameters);
    return Code('${element.name}$constructorName($parameters)');
  } on UnsupportedParametersException catch (e) {
    return Code(UnsupportedParametersMessage(parameters: e.parameters).build());
  }
}

String buildParameters(List<ParameterElement> parameters) {
  final paramValues = [];
  final unsupported = <String, String>{};
  for (final parameter in parameters) {
    try {
      final value = buildParameter(parameter);
      if (value == null) continue;
      paramValues.add(value);
    } on UnsupportedParameterException catch (e) {
      unsupported[parameter.name] = e.type;
    }
  }

  if (unsupported.isNotEmpty) {
    throw UnsupportedParametersException(unsupported);
  }

  return '${paramValues.join(',')}${paramValues.isNotEmpty ? ',' : ''}';
}

String? buildParameter(ParameterElement parameter) {
  String param(String type, dynamic code) {
    var value = parameter.defaultValueCode;
    if (code is! Raw) {
      value ??= literal(code).toString();
    } else {
      value ??= code.value.toString();
    }

    return "params.$type('${parameter.name}', $value)";
  }

  final colorChecker = TypeChecker.fromUrl('dart:ui#Color');

  final String value = switch (parameter.type) {
    DartType type when type.isDartCoreString => param('string', 'Text'),
    DartType type when type.isDartCoreBool => param('boolean', false),
    DartType type when colorChecker.isAssignableFromType(type) =>
      param('color', Raw('Colors.red')),
    _ => param('dynamic\$', defaultValueForType(parameter.type)),
  };

  if (parameter.isNamed) {
    return '${parameter.name}: $value';
  } else {
    return value;
  }
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
