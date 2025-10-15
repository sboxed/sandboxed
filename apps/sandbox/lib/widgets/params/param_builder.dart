import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed_sandbox/widgets/params/param_showcase.dart';

enum ParamOptionality { optional, required, default$ }

class ParamShowcaseItem<T> {
  final String? name;
  final ParamBuilder<T> Function(String id) builder;
  final String code;
  final String Function(T? value)? render;
  final T value;

  ParamShowcaseItem({
    required this.builder,
    required this.value,
    required this.code,
    this.render,
    this.name,
  });
}

class ParamBuildersSandbox extends StatelessWidget {
  final ParamStorage params;
  final ParamOptionality optionality;
  final Map<String, List<ParamShowcaseItem>> Function(ParamStorage params) builder;

  const ParamBuildersSandbox({
    super.key,
    required this.params,
    required this.builder,
    required this.optionality,
  });

  @override
  Widget build(BuildContext context) {
    final sections = builder(params);

    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in sections.entries)
            ParamShowcase(
              title: section.key,
              rows: section.value,
              optionality: optionality,
              params: params,
            ),
        ],
      ),
    );
  }
}
