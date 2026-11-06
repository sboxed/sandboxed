import 'package:equatable/equatable.dart';

class DocumentEntry with Equatable {
  final String name;
  final String content;

  const DocumentEntry({required this.name, required this.content});

  @override
  List<Object?> get props => [name, content];
}
