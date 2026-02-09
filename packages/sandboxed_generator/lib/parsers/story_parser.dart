import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed_generator/builders/story_parameter_builder.dart';
import 'package:sandboxed_generator/exception/unsupported_parameters.dart';
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
    TopLevelVariableElement element,
  ) {
    final generated = <String, Expression>{};
    generated['name'] = _generateStoryName(element);

    if (meta?.widget != null) {
      generated['builder'] = _generateStoryBuilder(meta!.widget!);
    }

    return generated;
  }

  Expression _generateStoryName(TopLevelVariableElement element) {
    return literal(element.name?.replaceAll(RegExp(r'^\$'), '').titleCase);
  }

  Expression _generateStoryBuilder(ClassElement widget) {
    return Method((method) {
      method.requiredParameters.addAll([
        Parameter((param) => param.name = 'context'),
        Parameter((param) => param.name = 'params'),
      ]);
      method.lambda = true;
      method.body = widget.isAbstract
          ? refer(
              'AbstractWidgetClassException',
              'package:sandboxed_core/sandboxed_core.dart',
            ).call([]).thrown.code
          : buildComponent(widget).code;
    }).closure;
  }

  Expression _createStoryExpression(
    TopLevelVariableElement element,
    Map<String, Expression> generated,
  ) {
    final name = element.name;
    if (name == null) throw ArgumentError.notNull('element.name');

    final story = refer(name, element.library.uri.toString());

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
    print(['build component', element, constructor, constructor.name]);
    final constructorName = (constructor.name?.isNotEmpty == true) //
        ? constructor.name!
        : 'new';

    try {
      return _buildWidgetExpression(element, constructor, constructorName);
    } on UnsupportedParametersException catch (e) {
      return CodeExpression(
          Code(UnsupportedParametersMessage(parameters: e.parameters).build()));
    }
  }

  (List<Expression>, Map<String, Expression>) buildParameters(
    List<FormalParameterElement> parameters,
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

  Expression? buildParameter(FormalParameterElement parameter) {
    final parameterBuilder = StoryParameterBuilder(
      parameter,
      typesToIgnore: [
        TypeCheckers.key,
      ],
    );

    return TypeHandlers.handleType(parameter.type, parameterBuilder);
  }

  Expression _buildWidgetExpression(
    ClassElement element,
    ConstructorElement constructor,
    String constructorName,
  ) {
    final name = element.name;
    if (name == null) throw ArgumentError.notNull('element.name');

    Expression widget = refer(name, element.library.uri.toString());

    if (constructorName.isNotEmpty) {
      widget = widget.property(constructorName);
    }

    final (positional, named) = buildParameters(constructor.formalParameters);
    return widget.call(positional, named);
  }

  void _processParameter(
    FormalParameterElement parameter,
    List<Expression> positional,
    Map<String, Expression> named,
    Map<String, String> unsupported,
  ) {
    try {
      final value = buildParameter(parameter);
      if (value == null) return;

      parameter.isNamed
          ? named[parameter.name!] = value
          : positional.add(value);
    } on UnsupportedParameterException catch (e) {
      unsupported[parameter.name ?? '<unnamed>'] = e.type;
    }
  }
}
