import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/params/param_builder.dart';
import 'package:sandboxed_sandbox/widgets/params/param_showcase.dart';

Meta get meta => Meta<ParamShowcase>(name: "Params / Showcase");

Story get $Integer => _build("Integers", buildIntegerShowcase);

Story get $Double => _build("Doubles", buildDoubleShowcase);

Story get $String => _build("Strings", buildStringShowcase);

Story get $Boolean => _build("Booleans", buildBooleanShowcase);

Story get $Single => _build("Single", buildSingleShowcase);

Story get $Multi => _build("Multi", buildMultiShowcase);

Story get $DateTime => _build("DateTime", buildDateTimeShowcase);

Story get $Duration => _build("Duration", buildDurationShowcase);

Story get $Alignment => _build("Alignment", buildAlignmentShowcase);

Story get $Color => _build("Color", buildColorShowcase);

Story get $Gradient => _build("Gradient", buildGradientShowcase);

Story get $EdgeInsets => _build("Edge Insets", buildEdgeInsetsShowcase);

Story get $Json => _build("Json", buildJsonShowcase);

// -----------------------------------------------------------------------------

Story _build(
  String name,
  List<ParamShowcaseItem> Function(ParamStorage params) builder,
) {
  return Story(
    name: name,
    builder: (context, params) => ParamShowcase(
      title: name,
      rows: builder(params),
      optionality: ParamOptionality.required,
      params: params,
    ),
  );
}

List<ParamShowcaseItem> buildStringShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.string(id),
      value: "Hello world",
      code: "params.integer('string')\n\t.required(\"Hello world\")",
    ),
    ParamShowcaseItem(
      name: "multiline",
      builder: (id) => params.string(id, maxLines: null),
      value: "Hello\nworld",
      code:
          "params.integer('string', maxLines: null)\n"
          "\t.required(\"Hello\\nworld\")",
    ),
  ];
}

List<ParamShowcaseItem<dynamic>> buildIntegerShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.integer(id),
      value: 5,
      code: "params.integer('integer')\n\t.required(5)",
    ),
    ParamShowcaseItem(
      name: "slider",
      builder: (id) => params.integer(id).slider(max: 10),
      value: 5,
      code: "params.integer('integer')\n\t.slider(max: 10)\n\t.required(5)",
    ),
  ];
}

List<ParamShowcaseItem<dynamic>> buildDoubleShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.number(id),
      value: 0.5,
      code: "params.number('number')\n\t.required(0.5)",
    ),
    ParamShowcaseItem(
      name: "slider",
      builder: (id) => params.number(id).slider(max: 10),
      value: 0.5,
      code: "params.number('number')\n\t.slider(max: 10)\n\t.required(0.5)",
    ),
  ];
}

List<ParamShowcaseItem<dynamic>> buildBooleanShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.boolean(id),
      value: true,
      code: "params.boolean('boolean')\n\t.required(true)",
    ),
    ParamShowcaseItem(
      name: "checkbox",
      builder: (id) => params.boolean(id).checkbox(),
      value: true,
      code: "params.boolean('boolean')\n\t.checkbox()\n\t.required(true)",
    ),
  ];
}

List<ParamShowcaseItem> buildSingleShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.single(id, BlurStyle.values),
      value: BlurStyle.normal,
      code: "params.single('single', BlurStyle.values)\n\t.required(true)",
    ),
    ParamShowcaseItem(
      name: "segmented",
      builder: (id) => params.single(id, BlurStyle.values).segmented(),
      value: BlurStyle.normal,
      code: "params.single('single', BlurStyle.values).segmented()\n\t.required(true)",
    ),
  ];
}

List<ParamShowcaseItem> buildMultiShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.multi(id, BlurStyle.values),
      value: [BlurStyle.normal, BlurStyle.outer],
      code: "params.multi('multi', BlurStyle.values)\n\t.required([BlurStyle.normal])",
    ),
    ParamShowcaseItem(
      name: "segmented",
      builder: (id) => params.multi(id, BlurStyle.values).segmented(),
      value: [BlurStyle.normal, BlurStyle.outer],
      code: "params.multi('multi', BlurStyle.values).segmented()\n\t.required([BlurStyle.normal])",
    ),
  ];
}

List<ParamShowcaseItem> buildDateTimeShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.datetime(id),
      value: DateTime.now(),
      code: "params.datetime('datetime')\n\t.required(DateTime.now())",
    ),
  ];
}

List<ParamShowcaseItem> buildDurationShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.duration(id),
      value: Duration(hours: 5, minutes: 32, seconds: 54),
      code: "params.duration('duration')\n\t.required(Duration(seconds: 5))",
    ),
  ];
}

List<ParamShowcaseItem> buildAlignmentShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.align(id),
      value: Alignment.center,
      code: "params.align('alignment')\n\t.required(Alignment.center)",
    ),
  ];
}

List<ParamShowcaseItem> buildColorShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.color(id),
      value: Colors.green,
      render: (value) => (value as Color?)?.hex ?? "null",
      code: "params.color('color')\n\t.required(Colors.green)",
    ),
  ];
}

List<ParamShowcaseItem> buildGradientShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params.gradient(id),
      value: LinearGradient(colors: [Colors.red, Colors.green]),
      render: (value) {
        return (value as Gradient?)?.colors.map((e) => e.hex).join("\n") ?? "null";
      },
      code: "params.gradient('gradient')\n\t.required(LinearGradient(colors: [Colors.red, Colors.green]))",
    ),
  ];
}

List<ParamShowcaseItem> buildEdgeInsetsShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      name: "Geometry",
      value: EdgeInsets.zero,
      builder: (id) => params.padding(id),
      code: "params.padding('padding')\n\t.required(EdgeInsets.zero)",
    ),
    ParamShowcaseItem(
      name: "Classic",
      value: EdgeInsets.zero,
      builder: (id) => params
          .any<EdgeInsets>(id) //
          .editor(ParamEditor<EdgeInsets>()),
      code: "-",
    ),
    ParamShowcaseItem(
      name: "Directional",
      value: EdgeInsetsDirectional.zero,
      builder: (id) => params
          .any<EdgeInsetsDirectional>(id) //
          .withDefault(EdgeInsetsDirectional.zero)
          .editor(ParamEditor<EdgeInsetsDirectional>()),
      code: "-",
    ),
  ];
}

List<ParamShowcaseItem> buildJsonShowcase(ParamStorage params) {
  return [
    ParamShowcaseItem(
      builder: (id) => params
          .json<_Complex>(
            id,
            fromJson: _Complex.fromJson,
            toJson: _Complex.toJson$,
          )
          .withDefault(_Complex(name: "John", age: 32)),
      value: _Complex(name: "John", age: 32),
      code:
          "params.json<_Complex>("
          "\n\t'json',"
          "\n\tfromJson: _Complex.fromJson,"
          "\n\ttoJson: _Complex.toJson\$"
          "\n)"
          "\n.required(_Complex(name: \"John\", age: 32))",
    ),
  ];
}

class _Complex {
  final String name;
  final int age;

  const _Complex({required this.name, required this.age});

  static _Complex fromJson(Map<String, dynamic> json) => _Complex(name: json['name'], age: json['age']);

  static Map<String, dynamic> toJson$(_Complex complex) => {
    'name': complex.name,
    'age': complex.age,
  };

  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  @override
  String toString() {
    return "Complex(\n\tname: $name,\n\tage: $age\n)";
  }
}

extension on Color {
  String get hex {
    final r = (this.r * 255).round().toRadixString(16).padLeft(2, '0');
    final g = (this.g * 255).round().toRadixString(16).padLeft(2, '0');
    final b = (this.b * 255).round().toRadixString(16).padLeft(2, '0');
    final percent = (a * 100).round();

    return '${'#$r$g$b'.toUpperCase()}, $percent%';
  }
}
