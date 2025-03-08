import 'package:equatable/equatable.dart';

class Config with EquatableMixin {
  final String? module;

  const Config({this.module});

  @override
  List<Object?> get props => [module];
}
