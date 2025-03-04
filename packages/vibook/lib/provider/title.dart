import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'title.g.dart';

@riverpod
Widget title(Ref ref) {
  return const Text("VIBOOK");
}
