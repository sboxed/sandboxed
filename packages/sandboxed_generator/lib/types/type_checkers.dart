import 'package:sandboxed_generator/types/type_checker.dart';

class TypeCheckers {
  static final color = TypeChecker.fromUrl('dart:ui#Color');
  static final date = TypeChecker.fromUrl('dart:core#DateTime');
  static final duration = TypeChecker.fromUrl('dart:core#Duration');
  static final gradient =
      TypeChecker.fromName('Gradient', packageName: 'flutter');
  static final key = TypeChecker.fromName('Key', packageName: 'flutter');
}
