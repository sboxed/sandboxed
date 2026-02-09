import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/params/delegate_param_serializer.dart';

class TextStyleSerializer implements ParamSerializer<TextStyle> {
  const TextStyleSerializer();

  @override
  $serialize(TextStyle? value) {
    if (value == null) return null;
    final m = <String, dynamic>{};
    if (value.fontSize != null) m['fontSize'] = value.fontSize;
    if (value.fontWeight != null) {
      m['fontWeight'] = value.fontWeight!.value;
    }
    if (value.fontStyle != null) {
      m['fontStyle'] =
          value.fontStyle == FontStyle.italic ? 'italic' : 'normal';
    }
    if (value.color != null) m['color'] = value.color!.toARGB32();
    if (value.letterSpacing != null) {
      m['letterSpacing'] = value.letterSpacing;
    }
    if (value.wordSpacing != null) {
      m['wordSpacing'] = value.wordSpacing;
    }
    if (value.height != null) {
      m['height'] = value.height;
    }
    if (value.backgroundColor != null) {
      m['backgroundColor'] = value.backgroundColor!.toARGB32();
    }
    if (value.decoration != null && value.decoration != TextDecoration.none) {
      final list = <String>[];
      if (value.decoration!.contains(TextDecoration.underline)) {
        list.add('underline');
      }
      if (value.decoration!.contains(TextDecoration.overline)) {
        list.add('overline');
      }
      if (value.decoration!.contains(TextDecoration.lineThrough)) {
        list.add('lineThrough');
      }
      m['decoration'] = list.isEmpty ? 'none' : list.join(',');
    }
    if (value.decorationColor != null) {
      m['decorationColor'] = value.decorationColor!.toARGB32();
    }
    if (value.decorationStyle != null) {
      m['decorationStyle'] = value.decorationStyle.toString().split('.').last;
    }
    if (value.decorationThickness != null) {
      m['decorationThickness'] = value.decorationThickness;
    }
    if (value.fontFamily != null) {
      m['fontFamily'] = value.fontFamily;
    }
    if (value.fontFamilyFallback != null &&
        value.fontFamilyFallback!.isNotEmpty) {
      m['fontFamilyFallback'] = value.fontFamilyFallback;
    }
    if (value.shadows != null && value.shadows!.isNotEmpty) {
      m['shadows'] = value.shadows!
          .map((s) => {
                'color': s.color.toARGB32(),
                'offsetX': s.offset.dx,
                'offsetY': s.offset.dy,
                'blurRadius': s.blurRadius,
              })
          .toList();
    }
    return m.isEmpty ? null : m;
  }

  @override
  TextStyle? $deserialize(json) {
    if (json == null) return TextStyle();
    if (json is! Map) return TextStyle();
    final m = json;
    FontWeight? fontWeight;
    if (m['fontWeight'] case int w) {
      final matches = FontWeight.values.where((e) => e.value == w).toList();
      fontWeight = matches.isEmpty ? FontWeight.w400 : matches.first;
    }
    FontStyle? fontStyle;
    if (m['fontStyle'] case String s) {
      fontStyle = s == 'italic' ? FontStyle.italic : FontStyle.normal;
    }
    Color? color;
    if (m['color'] case Object c) {
      final n = c is num ? c.toInt() : int.tryParse(c.toString());
      if (n != null) color = Color(n);
    }
    TextDecoration? decoration;
    if (m['decoration'] case String s) {
      if (s != 'none' && s.isNotEmpty) {
        final list = <TextDecoration>[];
        for (final part in s.split(',')) {
          switch (part.trim()) {
            case 'underline':
              list.add(TextDecoration.underline);
              break;
            case 'overline':
              list.add(TextDecoration.overline);
              break;
            case 'lineThrough':
              list.add(TextDecoration.lineThrough);
              break;
          }
        }
        decoration =
            list.isEmpty ? TextDecoration.none : TextDecoration.combine(list);
      }
    }
    return TextStyle(
      fontSize: (m['fontSize'] as num?)?.toDouble(),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      letterSpacing: (m['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (m['wordSpacing'] as num?)?.toDouble(),
      height: (m['height'] as num?)?.toDouble(),
      backgroundColor: m['backgroundColor'] != null
          ? Color((m['backgroundColor'] as num).toInt())
          : null,
      decoration: decoration,
      decorationColor: m['decorationColor'] != null
          ? Color((m['decorationColor'] as num).toInt())
          : null,
      decorationStyle: m['decorationStyle'] is String
          ? TextDecorationStyle.values.firstWhere(
              (e) => e.toString().split('.').last == m['decorationStyle'],
              orElse: () => TextDecorationStyle.solid)
          : null,
      fontFamily: m['fontFamily'] as String?,
      fontFamilyFallback: m['fontFamilyFallback'] is List
          ? (m['fontFamilyFallback'] as List).whereType<String>().toList()
          : null,
      package: m['package'] as String?,
      shadows: m['shadows'] is List
          ? (m['shadows'] as List)
              .whereType<Map>()
              .map((shadowMap) => Shadow(
                  color: shadowMap['color'] != null
                      ? Color((shadowMap['color'] as num).toInt())
                      : const Color(0xFF000000),
                  offset: Offset(
                    (shadowMap['offsetX'] as num?)?.toDouble() ?? 0.0,
                    (shadowMap['offsetY'] as num?)?.toDouble() ?? 0.0,
                  ),
                  blurRadius:
                      (shadowMap['blurRadius'] as num?)?.toDouble() ?? 0.0))
              .toList()
          : null,
      decorationThickness: (m['decorationThickness'] as num?)?.toDouble(),
    );
  }
}
