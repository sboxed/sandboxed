import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtension on DartType {
  String? get url => (alias?.element2 ?? element3)?.library2?.uri.toString();
}
