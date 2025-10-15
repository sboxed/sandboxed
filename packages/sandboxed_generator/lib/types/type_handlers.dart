import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:sandboxed_generator/builders/story_parameter_builder.dart';
import 'package:sandboxed_generator/expression/raw.dart';
import 'package:sandboxed_generator/extension/dart_type_extension.dart';
import 'package:sandboxed_generator/types/type_checker.dart';
import 'package:sandboxed_generator/types/type_checkers.dart';
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:code_builder/code_builder.dart' as code_builder;

class TypeHandlers {
  static Expression? handleType(DartType type, StoryParameterBuilder builder) {
    return switch (type) {
      DartType type when type.isDartCoreString =>
        builder.build('string', 'Text'),
      DartType type when type.isDartCoreBool => builder.build('boolean', false),
      DartType type when type.isDartCoreNum => builder.build('number', 0.0),
      DartType type when type.isDartCoreDouble => builder.build('number', 0.0),
      DartType type when type.isDartCoreInt => builder.build('integer', 0),
      DartType type when type.element3 is EnumElement2 =>
        _handleEnum(type, builder),
      DartType type when TypeCheckers.color.isAssignableFromType(type) =>
        builder.build('color', Raw('Colors.red')),
      DartType type when TypeCheckers.date.isAssignableFromType(type) =>
        builder.build('datetime', Raw('DateTime.now()')),
      DartType type when TypeCheckers.duration.isAssignableFromType(type) =>
        builder.build('duration', Raw('Duration.zero')),
      DartType type when TypeCheckers.gradient.isAssignableFromType(type) =>
        builder.build('gradient',
            Raw("LinearGradient(colors: [Colors.black, Colors.white])")),
      _ => builder.build(type, defaultValueForType(type)),
    };
  }

  static dynamic defaultValueForType(DartType type) {
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

  static dynamic defaultValueForFlutterType(DartType type) {
    if (TypeChecker.fromName('Widget', packageName: 'flutter')
        .isAssignableFromType(type)) {
      return Raw('const SizedBox.shrink()');
    }

    return null;
  }

  static List<Reference> extractTypeWithHints(DartType type) {
    final result = buildTypeReference(type);
    final hints = switch (type) {
      InterfaceType type when type.typeArguments.isNotEmpty =>
        type.typeArguments //
            .map((it) => buildTypeReference(it))
            .toList(),
      _ => [refer('void'), refer('void')],
    };

    return [result, ...hints];
  }

  /// Builds a type reference for a given Dart type, handling various type scenarios.
  ///
  /// [type] is the Dart type to convert into a code builder reference.
  /// [tree] is an optional list of parent types to log detailed error messages.
  ///
  /// Throws a [StateError] if unable to resolve the type's symbol.
  static Reference buildTypeReference(DartType type,
      {List<DartType> tree = const []}) {
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

            for (final type in type.normalParameterTypes) {
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
          b.symbol = type.element3?.name3;
          b.isNullable = tree.isNotEmpty && //
              type.nullabilitySuffix == NullabilitySuffix.question;

          List<DartType> typeArgs = [];
          if (type.alias case InstantiatedTypeAliasElement alias) {
            typeArgs = alias.typeArguments;
            b.symbol = alias.element2.name3;
          } else if (type is InterfaceType) {
            typeArgs = type.typeArguments;
          }

          if (b.symbol == null) {
            throw StateError(
              'Failed to get name for $type under ${tree.map((e) => e.element3?.name3).join(', ')}, '
              'element - ${type.element3}, element3 - ${type.element3}',
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

  static Expression _handleEnum(DartType type, StoryParameterBuilder builder) {
    return builder.build(
      'single',
      refer(type.element3!.name3!, type.url)
          .property('values')
          .property('first'),
      positionalArgs: [
        refer(
          type.element3!.name3!,
          type.url,
        ).property('values')
      ],
    );
  }
}
