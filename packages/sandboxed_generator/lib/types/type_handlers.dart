import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:sandboxed_generator/builders/story_parameter_builder.dart';
import 'package:sandboxed_generator/expression/raw.dart';
import 'package:sandboxed_generator/extension/dart_type_extension.dart';
import 'package:sandboxed_generator/types/type_checker.dart';
import 'package:sandboxed_generator/types/type_checkers.dart';

class TypeHandlers {
  Expression? handleType(DartType type, StoryParameterBuilder builder) {
    return switch (type) {
      DartType type when type.isDartCoreString =>
        builder.build('string', 'Text'),
      DartType type when type.isDartCoreBool => builder.build('boolean', false),
      DartType type when type.isDartCoreNum => builder.build('number', 0.0),
      DartType type when type.isDartCoreDouble => builder.build('number', 0.0),
      DartType type when type.isDartCoreInt => builder.build('integer', 0),
      DartType type when type.element is EnumElement =>
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

  Expression _handleEnum(DartType type, StoryParameterBuilder builder) {
    return builder.build(
      'single',
      refer(type.element!.name!, type.url).property('values').property('first'),
      positionalArgs: [refer(type.element!.name!, type.url).property('values')],
    );
  }
}
