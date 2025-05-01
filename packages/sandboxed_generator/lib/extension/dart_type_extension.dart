import 'package:analyzer/dart/element/type.dart';
import 'package:sandboxed_generator/extension/element_extension.dart';

extension DartTypeExtension on DartType {
  String? get url => (alias?.element ?? element)?.url;
}
