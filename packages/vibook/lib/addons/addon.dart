import 'package:flutter/material.dart';
import 'package:vibook_core/decorator.dart';

abstract base class Addon<T> {
  String get id;

  ValueNotifier<T> get notifier;

  List<Decorator> decorate(BuildContext context);

  Widget buildEditor(BuildContext context);

  Map<String, dynamic> serialize();

  void deserialize(Map<String, dynamic> json);
}
