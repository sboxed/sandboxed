import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

// ignore: non_constant_identifier_names
Widget AutomaticBuilder(BuildContext context, Params params) {
  return const SizedBox();
}

typedef StoryBuilder = Widget Function(BuildContext context, Params params);
