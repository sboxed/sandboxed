import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({required this.duration});

  void debounce(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}
