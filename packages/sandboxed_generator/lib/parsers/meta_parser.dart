// ignore_for_file: implementation_imports

import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';

class MetaParser {
  final Resolver resolver;

  MetaParser({required this.resolver});

  Future<MetaDescription> parse(TopLevelVariableElement2 meta) async {
    final visitor = MetaVisitor();
    final getter = meta.getter2!;
    final ast = getter.hasImplicitReturnType
        ? await resolver.astNodeFor(meta.firstFragment, resolve: true)
        : await resolver.astNodeFor(meta.getter2!.firstFragment, resolve: true);
    ast?.visitChildren(visitor);

    return MetaDescription(
      widget: visitor.componentArgument ?? visitor.componentGeneric,
    );
  } //
}

class MetaDescription {
  final ClassElement2? widget;

  const MetaDescription({
    required this.widget,
  });
}

class MetaVisitor extends RecursiveAstVisitor {
  ClassElement2? componentGeneric;
  ClassElement2? componentArgument;

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    if (node.constructorName.type.element2?.name3 == 'Meta') {
      // find generic widget type.
      final typeArguments = node.constructorName.type.typeArguments?.arguments;
      if (typeArguments?.firstOrNull case NamedType type) {
        componentGeneric = type.element2 as ClassElement2?;
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
              ?.element;
      if (componentArgument case ClassElement2 component) {
        this.componentArgument = component;
      }
    }

    return super.visitInstanceCreationExpression(node);
  }
}
