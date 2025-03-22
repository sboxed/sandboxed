import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

extension TreeTypeX<T extends AbsNodeType> on TreeType<T> {
  TreeType<T> get root {
    if (parent != null) return parent!.root;

    return this;
  }
}
