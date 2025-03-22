import 'package:flutter/material.dart';
import 'package:vibook/params/param_serializer.dart';

final kDefaultSerializers = [
  DelegateParamValueSerializer<Color>(
    decoder: (value) => Color(int.parse(value)),
    encoder: (value) => value?.value.toString(),
  ),
  DelegateParamValueSerializer<String>(
    decoder: (value) => value,
    encoder: (value) => value,
  ),
  DelegateParamValueSerializer<int>(
    decoder: (value) => int.parse(value),
    encoder: (value) => value.toString(),
  ),
  DelegateParamValueSerializer<double>(
    decoder: (value) => double.parse(value),
    encoder: (value) => value.toString(),
  ),
  DelegateParamValueSerializer<num>(
    decoder: (value) => double.parse(value),
    encoder: (value) => value.toString(),
  ),
  DelegateParamValueSerializer<bool>(
    decoder: (value) => value == 'true',
    encoder: (value) => value.toString(),
  ),
];
