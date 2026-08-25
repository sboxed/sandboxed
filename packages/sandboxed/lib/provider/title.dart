import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget title(Ref ref) {
  return const Text("Sandboxed");
}

final titleProvider = Provider.autoDispose<Widget>(title);
