import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed/params/param_serializer.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

final kDefaultSerializers = [
  DelegateParamValueSerializer<Color>(
    decoder: (param, value) => Color(int.parse(value)),
    encoder: (param, value) => value?.value.toString(),
  ),
  DelegateParamValueSerializer<String>(
    decoder: (param, value) => value,
    encoder: (param, value) => value,
  ),
  DelegateParamValueSerializer<int>(
    decoder: (param, value) => int.parse(value),
    encoder: (param, value) => value.toString(),
  ),
  DelegateParamValueSerializer<double>(
    decoder: (param, value) => double.parse(value),
    encoder: (param, value) => value.toString(),
  ),
  DelegateParamValueSerializer<num>(
    decoder: (param, value) => double.parse(value),
    encoder: (param, value) => value.toString(),
  ),
  DelegateParamValueSerializer<bool>(
    decoder: (param, value) => value == 'true',
    encoder: (param, value) => value.toString(),
  ),
  DelegateParamValueSerializer<Enum>(
    check: (param) => param is SingleChoiceParamWrapper<Enum>,
    encoder: (param, value) {
      return value?.name;
    },
    decoder: (param, data) {
      final items = (param as SingleChoiceParamWrapper<Enum>).values;
      return items.firstWhereOrNull((element) => element.name == data);
    },
  ),
  DelegateParamValueSerializer<List<Enum>>(
    check: (param) => param is MultiChoiceParamWrapper<Enum>,
    encoder: (param, value) => value?.map((e) => e.name).toList(),
    decoder: (param, data) {
      final items = (param as MultiChoiceParamWrapper<Enum>).values;
      return items
          .where((element) => (data as List).contains(element.name))
          .toList();
    },
  ),
];
