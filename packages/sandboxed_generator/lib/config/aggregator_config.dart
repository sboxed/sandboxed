import 'dart:convert';

class AggregatorConfig {
  final String outputPath;
  final String packagesModuleName;

  const AggregatorConfig({
    this.outputPath = 'components.g.dart',
    this.packagesModuleName = 'Packages',
  });

  Map<String, dynamic> toMap() {
    return {
      'output_path': outputPath,
      'packages_module_name': packagesModuleName,
    };
  }

  factory AggregatorConfig.fromMap(Map<String, dynamic> map) {
    return AggregatorConfig(
      outputPath: map['output_path'] ?? 'components.g.dart',
      packagesModuleName: map['packages_module_name'] ?? 'Packages',
    );
  }

  String toJson() => json.encode(toMap());

  factory AggregatorConfig.fromJson(String source) =>
      AggregatorConfig.fromMap(json.decode(source));
}
