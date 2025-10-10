import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'title.g.dart';

@riverpod
Widget title(Ref ref) {
  return const Text("Sandboxed");
}
