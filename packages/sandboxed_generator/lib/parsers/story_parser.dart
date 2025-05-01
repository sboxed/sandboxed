import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:code_builder/code_builder.dart' as code_builder;
import 'package:recase/recase.dart';
import 'package:sandboxed_generator/builders/story_parameter_builder.dart';
import 'package:sandboxed_generator/exception/unsupported_parameters.dart';
import 'package:sandboxed_generator/extension/dart_type_extension.dart';
import 'package:sandboxed_generator/extension/element_extension.dart';
import 'package:sandboxed_generator/parsers/meta_parser.dart';
import 'package:sandboxed_generator/types/type_checkers.dart';
import 'package:sandboxed_generator/types/type_handlers.dart';
import 'package:sandboxed_generator/ui/unsupported_parameters_message.dart';

/// Parses story metadata and generates story expressions for top-level variable elements.
///
/// This class is responsible for extracting and generating metadata for stories,
/// including their names, builders, and other associated information.
class StoryParser {
  final Resolver resolver;
  final MetaDescription? meta;

  StoryParser({required this.resolver, required this.meta});

  Future<Expression> parse(TopLevelVariableElement element) async {
    final generated = _generateStoryMetadata(element);
    final story = _createStoryExpression(element, generated);
    return story;
  }

  Map<String, Expression> _generateStoryMetadata(
      TopLevelVariableElement element) {
    final generated = <String, Expression>{};
    generated['name'] = _generateStoryName(element);

    if (meta?.widget != null) {
      generated['builder'] = _generateStoryBuilder(meta!.widget!);
    }

    return generated;
  }

  Expression _generateStoryName(TopLevelVariableElement element) {
    return literal(element.name.replaceAll(RegExp(r'^\$'), '').titleCase);
  }

  Expression _generateStoryBuilder(ClassElement widget) {
    return Method((method) {
      method.requiredParameters.addAll([
        Parameter((param) => param.name = 'context'),
        Parameter((param) => param.name = 'params'),
      ]);
      method.lambda = true;
      method.body = buildComponent(widget).code;
    }).closure;
  }

  Expression _createStoryExpression(
    TopLevelVariableElement element,
    Map<String, Expression> generated,
  ) {
    final story = refer(element.name, element.url);

    if (generated.isEmpty) return story;

    return story.property('applyGenerated').call(
      [],
      {
        for (final item in generated.entries) //
          item.key: item.value,
      },
    );
  }

  Expression buildComponent(ClassElement element) {
    final constructor = element.constructors.first;
    final constructorName =
        constructor.name.isNotEmpty ? '.${constructor.name}' : '';

    try {
      return _buildWidgetExpression(element, constructor, constructorName);
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
      _processParameter(parameter, positional, named, unsupported);
    }

    if (unsupported.isNotEmpty) {
      throw UnsupportedParametersException(unsupported);
    }

    return (positional, named);
  }

  Expression? buildParameter(ParameterElement parameter) {
    final typeHandlers = TypeHandlers();
    final parameterBuilder = StoryParameterBuilder(
      parameter,
      typesToIgnore: [
        TypeCheckers.key,
      ],
    );

    return typeHandlers.handleType(parameter.type, parameterBuilder);
  }

  Expression _buildWidgetExpression(
    ClassElement element,
    ConstructorElement constructor,
    String constructorName,
  ) {
    Expression widget = refer(element.name, element.url);

    if (constructorName.isNotEmpty) {
      widget = widget.property(constructorName);
    }

    final (positional, named) = buildParameters(constructor.parameters);
    return widget.call(positional, named);
  }

  void _processParameter(
    ParameterElement parameter,
    List<Expression> positional,
    Map<String, Expression> named,
    Map<String, String> unsupported,
  ) {
    try {
      final value = buildParameter(parameter);
      if (value == null) return;

      parameter.isNamed ? named[parameter.name] = value : positional.add(value);
    } on UnsupportedParameterException catch (e) {
      unsupported[parameter.name] = e.type;
    }
  }
}

/// Builds a type reference for a given Dart type, handling various type scenarios.
///
/// [type] is the Dart type to convert into a code builder reference.
/// [tree] is an optional list of parent types to log detailed error messages.
///
/// Throws a [StateError] if unable to resolve the type's symbol.
Reference buildTypeReference(DartType type, {List<DartType> tree = const []}) {
  final childTree = [...tree, type];

  switch (type) {
    case VoidType():
      return refer('void');

    case analyzer.FunctionType():
      return code_builder.FunctionType(
        (function) {
          function.returnType = buildTypeReference(
            type.returnType,
            tree: childTree,
          );

          for (final type in type.positionalParameterTypes) {
            function.requiredParameters
                .add(buildTypeReference(type, tree: childTree));
          }

          for (final type in type.optionalParameterTypes) {
            function.optionalParameters
                .add(buildTypeReference(type, tree: childTree));
          }

          for (final MapEntry(:key, :value)
              in type.namedParameterTypes.entries) {
            function.namedParameters[key] =
                buildTypeReference(value, tree: childTree);
          }
        },
      );

    case analyzer.RecordType():
      return code_builder.RecordType((record) {
        for (final field in type.positionalFields) {
          record.positionalFieldTypes.add(
            buildTypeReference(
              field.type,
              tree: childTree,
            ),
          );
        }

        for (final field in type.namedFields) {
          record.namedFieldTypes[field.name] = buildTypeReference(
            field.type,
            tree: childTree,
          );
        }
      });

    default:
      return TypeReference((b) {
        b.url = type.url;
        b.symbol = type.element?.name;
        b.isNullable = tree.isNotEmpty && //
            type.nullabilitySuffix == NullabilitySuffix.question;

        List<DartType> typeArgs = [];
        if (type.alias case InstantiatedTypeAliasElement alias) {
          typeArgs = alias.typeArguments;
          b.symbol = alias.element.name;
        } else if (type is InterfaceType) {
          typeArgs = type.typeArguments;
        }

        if (b.symbol == null) {
          throw StateError(
            'Failed to get name for $type under ${tree.map((e) => e.element?.name).join(', ')}, '
            'element - ${type.element}, element3 - ${type.element3}',
          );
        }

        for (final childType in typeArgs) {
          b.types.add(
            buildTypeReference(
              childType,
              tree: childTree,
            ),
          );
        }
      });
  }
}
