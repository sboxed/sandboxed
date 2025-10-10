import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:sandboxed_generator/expression/raw.dart';
import 'package:sandboxed_generator/types/type_checker.dart';
import 'package:sandboxed_generator/types/type_handlers.dart';

class StoryParameterBuilder {
  final FormalParameterElement parameter;
  final List<TypeChecker> typesToIgnore;

  StoryParameterBuilder(this.parameter, {this.typesToIgnore = const []});

  Expression build(
    dynamic type,
    dynamic code, {
    List<Expression> positionalArgs = const [],
    Map<String, Expression> namedArgs = const {},
  }) {
    final value = _resolveDefaultValue(code);
    final param = _buildParamExpression(type, positionalArgs, namedArgs);

    if (parameter.isOptional && parameter.defaultValueCode == null) {
      return _handleOptionalParameter(param);
    }

    return value == null
        ? param.property('default\$').call([])
        : param.property('required').call([value]);
  }

  Expression? handleEnumDefaultValue(
    String defaultValue,
    EnumElement enum$,
    Expression? value,
  ) {
    if (defaultValue.startsWith('${enum$.name}.')) {
      final parts = defaultValue.split('.').skip(1);
      value = refer(enum$.name ?? '', enum$.librarySource.uri.toString());
      for (final part in parts) {
        value = value!.property(part);
      }
    }
    return value;
  }

  Expression? _resolveDefaultValue(dynamic code) {
    Expression? value;

    if (parameter.defaultValueCode case String defaultValue) {
      if (parameter.type.element case EnumElement enum$) {
        value = handleEnumDefaultValue(defaultValue, enum$, value);
      } else if (!defaultValue.startsWith('_')) {
        value = CodeExpression(Code(defaultValue));
      }
    }

    return _resolveCodeValue(code, value);
  }

  Expression? _resolveCodeValue(dynamic code, Expression? value) {
    return switch (code) {
      Raw code => value ?? CodeExpression(Code(code.value.toString())),
      Expression expression => value ?? expression,
      null => value,
      _ => value ?? literal(code),
    };
  }

  Expression _buildParamExpression(
    dynamic type,
    List<Expression> positionalArgs,
    Map<String, Expression> namedArgs,
  ) {
    return switch (type) {
      String internal =>
        _buildInternalParam(internal, positionalArgs, namedArgs),
      DartType type => _buildDynamicParam(type, positionalArgs, namedArgs),
      Object() => throw UnimplementedError(),
      null => throw UnimplementedError(),
    };
  }

  Expression _buildInternalParam(
    String internal,
    List<Expression> positionalArgs,
    Map<String, Expression> namedArgs,
  ) {
    final name = parameter.name3;
    if (name == null) throw ArgumentError.notNull('parameter.name3');

    return refer('params')
        .property(internal)
        .call([literalString(name, raw: true), ...positionalArgs], namedArgs);
  }

  Expression _buildDynamicParam(
    DartType type,
    List<Expression> positionalArgs,
    Map<String, Expression> namedArgs,
  ) {
    final types = TypeHandlers.extractTypeWithHints(type).take(3).toList();
    if (types.length < 3) {
      types.addAll(List.filled(3 - types.length, refer('void')));
    }

    final name = parameter.name3;
    if (name == null) throw ArgumentError.notNull('parameter.name3');

    return refer('params').property('any').call(
          [literalString(name, raw: true), ...positionalArgs],
          namedArgs,
          [types.first],
        );
  }

  Expression _handleOptionalParameter(Expression param) {
    final shouldBeIgnored = typesToIgnore.any(
      (checker) => checker.isAssignableFromType(parameter.type),
    );

    if (shouldBeIgnored) {
      return literal(null);
    }

    return param.property('optional').call([literal(null)]);
  }
}
