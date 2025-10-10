import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ValueType {
  string,
  number,
  boolean,
  object,
  list,
}

ValueType inferType(dynamic v) {
  if (v is bool) return ValueType.boolean;
  if (v is num) return ValueType.number;
  if (v is String) return ValueType.string;
  if (v is Map<String, dynamic>) return ValueType.object;
  if (v is List) return ValueType.list;
  return ValueType.string;
}

dynamic defaultFor(ValueType t) {
  switch (t) {
    case ValueType.string:
      return '';
    case ValueType.number:
      return 0;
    case ValueType.boolean:
      return false;
    case ValueType.object:
      return <String, dynamic>{};
    case ValueType.list:
      return <dynamic>[];
  }
}

class KeyValueEditorWidget extends StatefulWidget {
  final ValueType type;
  final dynamic value;
  final void Function(dynamic value) onChange;

  const KeyValueEditorWidget({
    super.key,
    required this.type,
    required this.onChange,
    this.value,
  });

  @override
  State<KeyValueEditorWidget> createState() => _KeyValueEditorWidgetState();
}

class _KeyValueEditorWidgetState extends State<KeyValueEditorWidget> {
  late ValueType _type;
  dynamic _value;

  @override
  void initState() {
    super.initState();
    _type = widget.type;
    _value = widget.value ?? defaultFor(widget.type);
  }

  @override
  void didUpdateWidget(covariant KeyValueEditorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync external updates
    if (oldWidget.type != widget.type) {
      _type = widget.type;
    }
    if (oldWidget.value != widget.value) {
      _value = widget.value ?? defaultFor(_type);
    }
  }

  void _emit(dynamic v) {
    setState(() {
      _value = v;
    });
    widget.onChange(v);
  }

  @override
  Widget build(BuildContext context) {
    final body = switch (_type) {
      ValueType.string => _StringEditor(
        value: (_value is String ? _value : '') as String,
        onChanged: _emit,
      ),
      ValueType.number => _NumberEditor(
        value: (_value is num ? _value : 0) as num,
        onChanged: (num v) => _emit(v),
      ),
      ValueType.boolean => _BooleanEditor(
        value: (_value is bool ? _value : false) as bool,
        onChanged: (bool v) => _emit(v),
      ),
      ValueType.object => _ObjectEditor(
        map: (_value is Map<String, dynamic> ? _value : <String, dynamic>{}) as Map<String, dynamic>,
        onChanged: _emit,
      ),
      ValueType.list => _ListEditor(
        list: (_value is List ? _value : <dynamic>[]) as List<dynamic>,
        onChanged: _emit,
      ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        body,
      ],
    );
  }
}

/// STRING
class _StringEditor extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  const _StringEditor({required this.value, required this.onChanged});

  @override
  State<_StringEditor> createState() => _StringEditorState();
}

class _StringEditorState extends State<_StringEditor> {
  late final TextEditingController _c;

  @override
  void initState() {
    super.initState();
    _c = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _StringEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && widget.value != _c.text) {
      _c.text = widget.value;
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _c,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Text',
      ),
      onChanged: widget.onChanged,
    );
  }
}

/// NUMBER
class _NumberEditor extends StatefulWidget {
  final num value;
  final ValueChanged<num> onChanged;
  const _NumberEditor({required this.value, required this.onChanged});

  @override
  State<_NumberEditor> createState() => _NumberEditorState();
}

class _NumberEditorState extends State<_NumberEditor> {
  late final TextEditingController _c;

  @override
  void initState() {
    super.initState();
    _c = TextEditingController(text: widget.value.toString());
  }

  @override
  void didUpdateWidget(covariant _NumberEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    final txt = widget.value.toString();
    if (oldWidget.value != widget.value && _c.text != txt) {
      _c.text = txt;
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  num _parse(String s) {
    if (s.isEmpty) return 0;
    final i = int.tryParse(s);
    if (i != null) return i;
    final d = double.tryParse(s);
    return d ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _c,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Number',
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[-0-9\.]'))],
      onChanged: (s) => widget.onChanged(_parse(s)),
    );
  }
}

/// BOOLEAN
class _BooleanEditor extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _BooleanEditor({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Value'),
      value: value,
      onChanged: onChanged,
    );
  }
}

/// OBJECT (Map<String, dynamic>)
class _ObjectEditor extends StatefulWidget {
  final Map<String, dynamic> map;
  final ValueChanged<Map<String, dynamic>> onChanged;

  const _ObjectEditor({required this.map, required this.onChanged});

  @override
  State<_ObjectEditor> createState() => _ObjectEditorState();
}

class _ObjectEditorState extends State<_ObjectEditor> {
  late Map<String, dynamic> _map;

  @override
  void initState() {
    super.initState();
    _map = Map<String, dynamic>.from(widget.map);
  }

  @override
  void didUpdateWidget(covariant _ObjectEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.map, widget.map)) {
      _map = Map<String, dynamic>.from(widget.map);
    }
  }

  void _emit() => widget.onChanged(Map<String, dynamic>.from(_map));

  void _addEntry() {
    String base = 'key';
    String key = base;
    int i = 1;
    while (_map.containsKey(key)) {
      key = '$base$i';
      i++;
    }
    setState(() {
      _map[key] = '';
    });
    _emit();
  }

  void _removeEntry(String k) {
    setState(() {
      _map.remove(k);
    });
    _emit();
  }

  void _renameKey(String oldKey, String newKey) {
    if (oldKey == newKey || newKey.isEmpty) return;
    if (_map.containsKey(newKey)) return;
    final v = _map[oldKey];
    setState(() {
      _map.remove(oldKey);
      _map[newKey] = v;
    });
    _emit();
  }

  void _setValue(String k, dynamic v) {
    setState(() {
      _map[k] = v;
    });
    _emit();
  }

  void _changeValueType(String k, ValueType next) {
    setState(() {
      _map[k] = defaultFor(next);
    });
    _emit();
  }

  @override
  Widget build(BuildContext context) {
    final entries = _map.entries.toList();
    return Column(
      children: [
        ...entries.map((e) {
          final vt = inferType(e.value);
          final keyCtrl = TextEditingController(text: e.key);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: keyCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Key',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (newKey) => _renameKey(e.key, newKey),
                        ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<ValueType>(
                        value: vt,
                        onChanged: (t) => t != null ? _changeValueType(e.key, t) : null,
                        items: ValueType.values
                            .map(
                              (t) => DropdownMenuItem(
                                value: t,
                                child: Text(t.name),
                              ),
                            )
                            .toList(),
                      ),
                      IconButton(
                        tooltip: 'Remove',
                        onPressed: () => _removeEntry(e.key),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: KeyValueEditorWidget(
                        type: vt,
                        value: e.value,
                        onChange: (v) => _setValue(e.key, v),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            onPressed: _addEntry,
            icon: const Icon(Icons.add),
            label: const Text('Add entry'),
          ),
        ),
      ],
    );
  }
}

/// LIST (List<dynamic>)
class _ListEditor extends StatefulWidget {
  final List<dynamic> list;
  final ValueChanged<List<dynamic>> onChanged;
  const _ListEditor({required this.list, required this.onChanged});

  @override
  State<_ListEditor> createState() => _ListEditorState();
}

class _ListEditorState extends State<_ListEditor> {
  late List<dynamic> _list;

  @override
  void initState() {
    super.initState();
    _list = List<dynamic>.from(widget.list);
  }

  @override
  void didUpdateWidget(covariant _ListEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.list, widget.list)) {
      _list = List<dynamic>.from(widget.list);
    }
  }

  void _emit() => widget.onChanged(List<dynamic>.from(_list));

  void _addItem() {
    setState(() {
      _list.add('');
    });
    _emit();
  }

  void _removeAt(int i) {
    setState(() {
      _list.removeAt(i);
    });
    _emit();
  }

  void _setAt(int i, dynamic v) {
    setState(() {
      _list[i] = v;
    });
    _emit();
  }

  void _changeTypeAt(int i, ValueType next) {
    setState(() {
      _list[i] = defaultFor(next);
    });
    _emit();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(_list.length, (i) {
          final v = _list[i];
          final vt = inferType(v);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('#$i'),
                      const Spacer(),
                      DropdownButton<ValueType>(
                        value: vt,
                        onChanged: (t) => t != null ? _changeTypeAt(i, t) : null,
                        items: ValueType.values
                            .map(
                              (t) => DropdownMenuItem(
                                value: t,
                                child: Text(t.name),
                              ),
                            )
                            .toList(),
                      ),
                      IconButton(
                        tooltip: 'Remove',
                        onPressed: () => _removeAt(i),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: KeyValueEditorWidget(
                      type: vt,
                      value: v,
                      onChange: (val) => _setAt(i, val),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
            label: const Text('Add item'),
          ),
        ),
      ],
    );
  }
}
