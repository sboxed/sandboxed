/// Copied from [@devfelipereis/map_diff](https://github.com/devfelipereis/map_diff/blob/main/lib/src/map_diff.dart)
library map_diff;

import 'package:collection/collection.dart';

final _listDeepEq = const DeepCollectionEquality().equals;

/// Compares two maps and returns the differences between them.
/// [left] a map to compare.
/// [right] a map to compare.
Map _mapDifference(Map left, Map right) {
  final rightCopy = Map.of(right);
  final diff = {};

  left.forEach((leftKey, leftValue) {
    if (!right.containsKey(leftKey)) {
      diff[leftKey] = leftValue;
      return;
    }

    final rightValue = right[leftKey];

    switch ((leftValue, rightValue)) {
      case (Map(), Map()):
        diff[leftKey] = _mapDifference(leftValue, rightValue);
        break;
      case (List(), List()):
        if (!_listDeepEq(leftValue, rightValue)) {
          diff[leftKey] = rightValue;
        }
        break;
      case (_, _):
        if (leftValue != rightValue) {
          diff[leftKey] = rightValue;
        }
        break;
    }

    rightCopy.remove(leftKey);
  });

  return {...diff, ...rightCopy}
    ..removeWhere((key, value) => (value is Map && value.isEmpty));
}

extension MapDifferenceX<TKey, TValue> on Map<TKey, TValue> {
  Map<TKey, TValue> difference(Map<TKey, TValue> other) {
    return _mapDifference(this, other).cast();
  }
}
