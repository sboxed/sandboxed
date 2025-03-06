import 'package:flutter/material.dart';

final class HexColor extends Color {
  static String _repeatEvery(String text, int times) {
    final buffer = StringBuffer();
    for (final symbol in text.split('')) {
      for (var i = 0; i < times; i++) {
        buffer.write(symbol);
      }
    }

    return buffer.toString();
  }

  static int _getColorFromHex(String hex, {String alpha = 'FF'}) {
    final hexRegExp = RegExp(r'[a-fA-F0-9]+');
    final strippedHex = hexRegExp.firstMatch(hex)?.group(0);
    if (strippedHex == null) {
      throw ArgumentError('invalid hex value: $hex with alpha - $alpha');
    }

    int value = switch (strippedHex) {
      _ when strippedHex.length == 8 => int.parse("0x$strippedHex"),
      _ when strippedHex.length == 6 => int.parse("0x$alpha$strippedHex"),
      _ when strippedHex.length == 4 =>
        int.parse("0x${_repeatEvery(strippedHex, 2)}"),
      _ when strippedHex.length == 3 =>
        int.parse("0x$alpha${_repeatEvery(strippedHex, 2)}"),
      _ => throw ArgumentError('invalid hex value: $hex with alpha - $alpha'),
    };

    return value;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

abstract final class SvgColor {
  static ColorFilter withColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}

extension ToHexX on Color {
  String get hexValue {
    // TODO(@melvspace): 03/06/25 flutter 3.29.0 version
    // return '#${toARGB32().toRadixString(16)}';

    return '#${value.toRadixString(16)}';
  }
}

extension StringToColor on String {
  Color get color {
    return HexColor(this);
  }
}
