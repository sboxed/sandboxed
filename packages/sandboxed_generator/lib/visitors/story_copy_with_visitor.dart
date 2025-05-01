import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class StoryCopyWithVisitor extends RecursiveAstVisitor {
  final Set<String> overrides = {};

  @override
  visitArgumentList(ArgumentList node) {
    if (node.parent case MethodInvocation parent) {
      _checkForMissingBuilder(parent, node);
    }

    return super.visitArgumentList(node);
  }

  void _checkForMissingBuilder(MethodInvocation parent, ArgumentList node) {
    if (parent.methodName.name == 'Story' &&
        !node.arguments
            .whereType<NamedExpression>()
            .any((element) => element.name.label.name == 'builder')) {
      overrides.add('builder');
    }
  }
}
