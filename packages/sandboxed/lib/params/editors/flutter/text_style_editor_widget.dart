import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sandboxed/sandboxed.dart';

class TextStyleEditorPresenter extends ValueEditorPresenter<TextStyle> {
  final ParamEditor<TextStyle> editor;

  const TextStyleEditorPresenter(this.editor);

  @override
  Widget build(BuildContext context, ParamValue<TextStyle> value) {
    return TextStyleEditorWidget.builder(context, value);
  }
}

class TextStyleEditorWidget extends StatefulWidget {
  static Widget builder(BuildContext context, ParamValue<TextStyle> value) {
    return TextStyleEditorWidget(value: value);
  }

  final ParamValue<TextStyle> value;

  const TextStyleEditorWidget({super.key, required this.value});

  @override
  State<TextStyleEditorWidget> createState() => _TextStyleEditorWidgetState();
}

class _TextStyleEditorWidgetState extends State<TextStyleEditorWidget> {
  TextStyle get current => widget.value.value ?? const TextStyle();

  void update(TextStyle Function(TextStyle) apply) {
    widget.value.update(apply(current));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _NumberField(
                label: 'Size',
                value: current.fontSize ?? 14,
                onChanged: (v) => update((s) => s.copyWith(fontSize: v)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _NumberField(
                label: 'Letter spacing',
                value: current.letterSpacing ?? 0,
                onChanged: (v) => update((s) => s.copyWith(letterSpacing: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _SectionLabel('Weight'),
        ChipsPicker<FontWeight>(
          value: current.fontWeight ?? FontWeight.normal,
          values: [
            for (final w in FontWeight.values) (w, _fontWeightLabel(w)),
          ],
          onSelected: (v) => update((s) => s.copyWith(fontWeight: v)),
        ),
        const SizedBox(height: 8),
        _SectionLabel('Style'),
        ChipsPicker<FontStyle>(
          value: current.fontStyle ?? FontStyle.normal,
          values: const [
            (FontStyle.normal, 'Normal'),
            (FontStyle.italic, 'Italic'),
          ],
          onSelected: (v) => update((s) => s.copyWith(fontStyle: v)),
        ),
        const SizedBox(height: 8),
        _SectionLabel('Color'),
        SBColorPicker(
          value: current.color ?? Colors.black,
          onChanged: (v) => update((s) => s.copyWith(color: v)),
        ),
        const SizedBox(height: 8),
        _SectionLabel('Decoration'),
        _DecorationChips(
          decoration: current.decoration ?? TextDecoration.none,
          onChanged: (v) => update((s) => s.copyWith(decoration: v)),
        ),
        if (current.decoration != null &&
            current.decoration != TextDecoration.none) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionLabel('Decoration color'),
                    SBColorPicker(
                      value: current.decorationColor ??
                          current.color ??
                          Colors.black,
                      onChanged: (v) =>
                          update((s) => s.copyWith(decorationColor: v)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _NumberField(
                  label: 'Thickness',
                  value: current.decorationThickness ?? 1.0,
                  onChanged: (v) =>
                      update((s) => s.copyWith(decorationThickness: v)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _SectionLabel('Decoration style'),
          ChipsPicker<TextDecorationStyle>(
            value: current.decorationStyle ?? TextDecorationStyle.solid,
            values: const [
              (TextDecorationStyle.solid, 'Solid'),
              (TextDecorationStyle.double, 'Double'),
              (TextDecorationStyle.dotted, 'Dotted'),
              (TextDecorationStyle.dashed, 'Dashed'),
              (TextDecorationStyle.wavy, 'Wavy'),
            ],
            onSelected: (v) => update((s) => s.copyWith(decorationStyle: v)),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _NumberField(
                label: 'Height (line height)',
                value: current.height ?? 1.0,
                onChanged: (v) => update((s) => s.copyWith(height: v)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _NumberField(
                label: 'Word spacing',
                value: current.wordSpacing ?? 0,
                onChanged: (v) => update((s) => s.copyWith(wordSpacing: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _SectionLabel('Font family'),
        _TextInputField(
          label: 'Font family',
          value: current.fontFamily ?? '',
          onChanged: (v) =>
              update((s) => s.copyWith(fontFamily: v.isEmpty ? null : v)),
        ),
      ],
    );
  }
}

String _fontWeightLabel(FontWeight w) {
  return switch (w.value) {
    100 => 'Thin',
    200 => 'Extra light',
    300 => 'Light',
    400 => 'Normal',
    500 => 'Medium',
    600 => 'Semi bold',
    700 => 'Bold',
    800 => 'Extra bold',
    900 => 'Black',
    _ => 'W${w.value}',
  };
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}

class _NumberField extends StatefulWidget {
  const _NumberField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<_NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<_NumberField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value.toString(),
  );

  @override
  void didUpdateWidget(covariant _NumberField oldWidget) {
    if (oldWidget.value != widget.value &&
        _controller.text != widget.value.toString()) {
      _controller.text = widget.value.toString();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final v = double.tryParse(_controller.text.replaceAll(',', '.'));
    if (v != null) widget.onChanged(v);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d\.\,\-\e]')),
      ],
      onSubmitted: (_) => _submit(),
      onTapOutside: (_) => _submit(),
    );
  }
}

class _TextInputField extends StatefulWidget {
  const _TextInputField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  State<_TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<_TextInputField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );

  @override
  void didUpdateWidget(covariant _TextInputField oldWidget) {
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    widget.onChanged(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      onSubmitted: (_) => _submit(),
      onTapOutside: (_) => _submit(),
    );
  }
}

class _DecorationChips extends StatelessWidget {
  const _DecorationChips({
    required this.decoration,
    required this.onChanged,
  });

  final TextDecoration decoration;
  final ValueChanged<TextDecoration> onChanged;

  void _toggle(TextDecoration d) {
    if (decoration == TextDecoration.none) {
      onChanged(d);
      return;
    }
    if (decoration.contains(d)) {
      final list = <TextDecoration>[
        if (decoration.contains(TextDecoration.underline))
          TextDecoration.underline,
        if (decoration.contains(TextDecoration.overline))
          TextDecoration.overline,
        if (decoration.contains(TextDecoration.lineThrough))
          TextDecoration.lineThrough,
      ]..remove(d);
      onChanged(
          list.isEmpty ? TextDecoration.none : TextDecoration.combine(list));
    } else {
      final list = [
        if (decoration.contains(TextDecoration.underline))
          TextDecoration.underline,
        if (decoration.contains(TextDecoration.overline))
          TextDecoration.overline,
        if (decoration.contains(TextDecoration.lineThrough))
          TextDecoration.lineThrough,
        d,
      ];
      onChanged(TextDecoration.combine(list));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ChoiceChip(
          selected: decoration == TextDecoration.none,
          label: const Text('None'),
          onSelected: (_) => onChanged(TextDecoration.none),
        ),
        ChoiceChip(
          selected: decoration.contains(TextDecoration.underline),
          label: const Text('Underline'),
          onSelected: (_) => _toggle(TextDecoration.underline),
        ),
        ChoiceChip(
          selected: decoration.contains(TextDecoration.lineThrough),
          label: const Text('Line through'),
          onSelected: (_) => _toggle(TextDecoration.lineThrough),
        ),
        ChoiceChip(
          selected: decoration.contains(TextDecoration.overline),
          label: const Text('Overline'),
          onSelected: (_) => _toggle(TextDecoration.overline),
        ),
      ],
    );
  }
}
