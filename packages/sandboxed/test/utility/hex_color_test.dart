import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed/utility/hex_color.dart';

void main() {
  test('returns normally', () {
    check(() => HexColor('aef')).returnsNormally();
    check(() => HexColor('Fff')).returnsNormally();
    check(() => HexColor('#fff')).returnsNormally();
    check(() => HexColor('#00FFee')).returnsNormally();
    check(() => HexColor('#00FFee#')).returnsNormally();
    check(() => HexColor('00FFee')).returnsNormally();
    check(() => HexColor('FF00FFee')).returnsNormally();
    check(() => HexColor('#F0Fe')).returnsNormally();
    check(() => HexColor('F0Fe')).returnsNormally();
    check(() => HexColor('#0Fe')).returnsNormally();
    check(() => HexColor('0Fe')).returnsNormally();
  });

  test('throws', () {
    check(() => HexColor('azf')).throws();
    check(() => HexColor('#f#ff')).throws();
    check(() => HexColor('#00FFeae')).throws();
    check(() => HexColor('00sFFee')).throws();
  });
}
