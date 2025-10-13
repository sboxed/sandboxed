import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:sandboxed_core/src/params/params.dart';

extension FlutterParamsX on ParamStorage {
  ParamBuilder<Color> color(String id) {
    return ParamBuilder<Color>(id) //
        .store(this)
        .withDefault(Colors.blue)
        .serializable(DelegateParamSerializer(
          serialize: (value) => value?.toARGB32(),
          deserialize: (json) => Color(
            switch (json) {
              num number => number.toInt(),
              String string => int.parse(string),
              _ => throw ArgumentError.value("json"),
            },
          ),
        ))
        .editor(ParamEditor<Color>());
  }

  ParamBuilder<Alignment> align(String id) {
    return ParamBuilder<Alignment>(id) //
        .store(this)
        .withDefault(Alignment.center)
        .serializable(DelegateParamSerializer(
          serialize: (value) {
            if (value == null) return null;

            final [x, y] = [value.x, value.y];
            if (x == 0 && y == 0) {
              return "center";
            }
            if (![-1, 0, 1].contains(x)) {
              return [x, y];
            }
            if (![-1, 0, 1].contains(y)) {
              return [x, y];
            }

            final vertical = switch (y) {
              -1 => "top",
              0 => "center",
              1 => "bottom",
              _ => throw ArgumentError.value("y"),
            };

            final horizontal = switch (x) {
              -1 => "left",
              0 => "center",
              1 => "right",
              _ => throw ArgumentError.value("x"),
            };

            return "$vertical${horizontal.sentenceCase}";
          },
          deserialize: (json) {
            if (json case String name) {
              switch (name) {
                case "topLeft":
                  return Alignment.topLeft;
                case "topCenter":
                  return Alignment.topCenter;
                case "topRight":
                  return Alignment.topRight;
                case "centerLeft":
                  return Alignment.centerLeft;
                case "center":
                  return Alignment.center;
                case "centerRight":
                  return Alignment.centerRight;
                case "bottomLeft":
                  return Alignment.bottomLeft;
                case "bottomCenter":
                  return Alignment.bottomCenter;
                case "bottomRight":
                  return Alignment.bottomRight;
              }
            } else if (json case List list) {
              final [x, y] = list;
              return Alignment(x, y);
            }

            throw ArgumentError.value("json");
          },
        ))
        .editor(ParamEditor<Alignment>());
  }

  ParamBuilder<EdgeInsetsGeometry> padding(String id) {
    return ParamBuilder<EdgeInsetsGeometry>(id) //
        .store(this)
        .withDefault(EdgeInsets.zero)
        .serializable(EdgeInsetsSerializer())
        .editor(ParamEditor<EdgeInsetsGeometry>());
  }

  ParamBuilder<Gradient> gradient(String id) {
    return ParamBuilder<Gradient>(id) //
        .store(this)
        .withDefault(LinearGradient(colors: [Colors.green, Colors.red]))
        .editor(ParamEditor<Gradient>());
  }
}
