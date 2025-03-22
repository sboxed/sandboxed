import 'package:vibook_core/vibook_core.dart';

typedef ParamSerializerDelegate<T> = dynamic Function(T value);

class ParamSerializer {
  final List<ParamValueSerializer> delegates;

  const ParamSerializer({required this.delegates});

  dynamic encode<T>(ParamWrapper<T> param, T value) {
    for (final delegate in delegates) {
      if (delegate.canProcess(param)) {
        return delegate.encode(value);
      }
    }

    return null;
  }

  T? decode<T>(ParamWrapper<T> param, dynamic data) {
    for (final delegate in delegates) {
      if (delegate.canProcess(param)) {
        return delegate.decode(data);
      }
    }

    return null;
  }
}

abstract class ParamValueSerializer<T> {
  bool canProcess(ParamWrapper value);

  dynamic encode(T? value);

  T? decode(dynamic data);
}

final class DelegateParamValueSerializer<T> implements ParamValueSerializer<T> {
  final bool Function(ParamWrapper value)? check;
  final T? Function(dynamic data) decoder;
  final dynamic Function(T? value) encoder;

  DelegateParamValueSerializer({
    this.check,
    required this.encoder,
    required this.decoder,
  });

  @override
  bool canProcess(ParamWrapper value) {
    return check?.call(value) ?? value is ParamWrapper<T>;
  }

  @override
  dynamic encode(T? value) {
    final state = encoder(value);
    return state;
  }

  @override
  T? decode(dynamic data) {
    return decoder(data);
  }
}
