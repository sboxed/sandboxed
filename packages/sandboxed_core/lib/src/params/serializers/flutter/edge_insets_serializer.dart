import 'package:flutter/widgets.dart';
import 'package:sandboxed_core/src/params/delegate_param_serializer.dart';

class EdgeInsetsSerializer implements ParamSerializer<EdgeInsetsGeometry> {
  @override
  EdgeInsetsGeometry? $deserialize(json) {
    if (json case String string) {
      try {
        final tag = string.split('(').firstOrNull?.toLowerCase();
        final numbers = (string
                .split('(') //
                .lastOrNull
                ?.split(')')
                .firstOrNull)
            ?.split(',');

        if (tag == null || numbers == null) return null;

        final [topNumber, rightOrEndNumber, bottomNumber, leftOrStartNumber] =
            numbers;

        final top = double.parse(topNumber);
        final right = double.parse(rightOrEndNumber);
        final bottom = double.parse(bottomNumber);
        final left = double.parse(leftOrStartNumber);

        switch (tag) {
          case "classic":
            return EdgeInsets.only(
              top: top,
              right: right,
              bottom: bottom,
              left: left,
            );

          case "directional":
            return EdgeInsetsDirectional.only(
              top: top,
              end: right,
              bottom: bottom,
              start: left,
            );
        }
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  @override
  $serialize(EdgeInsetsGeometry value) {
    final tag = switch (value) {
      EdgeInsetsDirectional() => "directional",
      EdgeInsets() => "classic",
      _ => throw ArgumentError.value("value"),
    };

    final numbers = switch (value) {
      EdgeInsetsDirectional() => [
          value.top,
          value.end,
          value.bottom,
          value.start,
        ],
      EdgeInsets() => [
          value.top,
          value.right,
          value.bottom,
          value.left,
        ],
      _ => throw ArgumentError.value("value"),
    };

    return "$tag(${numbers.join(",")})";
  }
}
