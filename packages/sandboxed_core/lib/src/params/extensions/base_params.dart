import 'package:recase/recase.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_core/src/params/param_serializer.dart';

String defaultLabelBuilder(dynamic item) {
  switch (item) {
    case Enum enumValue:
      return enumValue.name.titleCase;

    default:
      return item.toString();
  }
}

extension BaseParamsX on ParamStorage {
  ParamBuilder<int> integer(String id) {
    return ParamBuilder<int>(id) //
        .store(this)
        .serializable(ParamSerializer.identity())
        .editor(IntegerEditor());
  }

  ParamBuilder<String> string(String id, {int? minLines, int? maxLines = 1}) {
    return ParamBuilder<String>(id) //
        .store(this)
        .serializable(ParamSerializer.identity())
        .editor(StringEditor(minLines: minLines, maxLines: maxLines));
  }

  ParamBuilder<double> number(String id) {
    return ParamBuilder<double>(id) //
        .store(this)
        .serializable(ParamSerializer.identity())
        .editor(DoubleEditor());
  }

  ParamBuilder<T> any<T>(String id) {
    return ParamBuilder<T>(id) //
        .store(this)
        .serializable(ParamSerializer.identity())
        .editor(ReadonlyEditor<T>());
  }

  ParamBuilder<DateTime> datetime(String id) {
    return ParamBuilder<DateTime>(id)
        .store(this) //
        .withDefault(DateTime.now())
        .serializable(ParamSerializer(
          serialize: (value) => value?.toIso8601String().replaceAll(":", "_"),
          deserialize: (json) => DateTime.parse(switch (json) {
            String string => string.replaceAll("_", ":"),
            _ => throw ArgumentError.value("json"),
          }),
        ))
        .editor(DateTimeEditor());
  }

  ParamBuilder<Duration> duration(String id) {
    return ParamBuilder<Duration>(id) //
        .store(this)
        .withDefault(Duration.zero)
        .serializable(ParamSerializer(
          serialize: (value) => value?.inMicroseconds,
          deserialize: (json) => Duration(
            microseconds: switch (json) {
              num number => number.toInt(),
              String string => int.parse(string),
              _ => throw ArgumentError.value("json"),
            },
          ),
        ))
        .editor(DurationEditor());
  }
}

extension SliderParam on ParamBuilder<double> {
  ParamBuilder<double> slider({
    double min = 0.0,
    double max = 1.0,
    double step = 0.1,
  }) {
    return editor(DoubleSliderEditor(min: min, max: max, step: step));
  }
}

extension SliderIntParam on ParamBuilder<int> {
  ParamBuilder<int> slider({
    int min = 0,
    int max = 100,
    int step = 1,
  }) {
    return editor(
      IntegerSliderEditor(
        min: min,
        max: max,
        step: step,
      ),
    );
  }
}
