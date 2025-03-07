import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';

class MetaParser {
  final Resolver resolver;

  MetaParser({required this.resolver});

  Future<MetaDescription> parse(TopLevelVariableElement meta) async {
    final visitor = MetaVisitor();
    final ast = await resolver.astNodeFor(meta.getter!, resolve: true);
    ast?.visitChildren(visitor);

    return MetaDescription(
      libraries: visitor.libraries,
      widget: visitor.componentArgument ?? visitor.componentGeneric,
    );
  }
}

class MetaDescription {
  final Set<LibraryElement> libraries;
  final ClassElement? widget;

  const MetaDescription({
    required this.libraries,
    required this.widget,
  });
}

class MetaVisitor extends RecursiveAstVisitor {
  final Set<LibraryElement> libraries = {};
  ClassElement? componentGeneric;
  ClassElement? componentArgument;

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    if (node.constructorName.type.element?.name == 'Meta') {
      // find generic widget type.
      final typeArguments = node.constructorName.type.typeArguments?.arguments;
      if (typeArguments?.firstOrNull case NamedType type) {
        componentGeneric = type.element as ClassElement?;
        if (componentGeneric?.library case LibraryElement element) {
          libraries.add(element);
        }
      }

      // find argument widget type.
      final componentArgumentExpression = node.argumentList.arguments
          .whereType<NamedExpression>()
          .firstWhereOrNull(
            (element) => element.name.label.name == 'component',
          )
          ?.expression;
      final componentArgument =
          (componentArgumentExpression as SimpleIdentifier?) //
              ?.staticElement;
      if (componentArgument case ClassElement component) {
        this.componentArgument = component;
        if (component.library case LibraryElement element) {
          libraries.add(element);
        }
      }
    }

    return super.visitInstanceCreationExpression(node);
  }
}
