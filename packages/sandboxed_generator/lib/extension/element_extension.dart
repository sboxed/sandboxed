import 'package:analyzer/dart/element/element.dart';

extension ElementExtension on Element {
  String? get url => library?.location!.components.first;
}
