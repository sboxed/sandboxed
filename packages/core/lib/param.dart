import 'package:flutter/foundation.dart';

class Param<TValue> extends ChangeNotifier {
  final Object? type;
  TValue value;

  Param(this.value, [this.type]);
}
