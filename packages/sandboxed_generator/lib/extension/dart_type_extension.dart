import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtension on DartType {
  String? get url => (alias?.element ?? element)?.library?.uri.toString();
}
