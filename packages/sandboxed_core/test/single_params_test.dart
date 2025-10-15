import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ParamStorage params;

  setUp(() {
    params = ParamStorage(
      editors3: [
        _ParamEditorFactory(),
      ],
    );
  });

  test("params.multi() works", () {
    params.single("id", [1, 2, 3]).required(1);
    expect(params.get("id")?.value, 1);
    expect(params.get("id")?.editor, isA<_SingleChipsEditorPresenter>());
  });

  test("segmented changes editor", () {
    final value = params.single("id", [1, 2, 3]).segmented().required(1);

    expect(value, 1);
    expect(params.get("id")?.editor, isA<_SingleSegmentedEditorPresenter>());
  });
}

class _ParamEditorFactory
    extends ParamEditorFactory<ValueEditorPresenter<dynamic>?> {
  const _ParamEditorFactory();

  @override
  ValueEditorPresenter<dynamic>? createListEditor<TItem>(
    ListParamEditor<TItem> e,
  ) {
    return null;
  }

  @override
  ValueEditorPresenter? create<T>(ParamEditor e) {
    switch (e) {
      case SingleChipsEditor<T>():
        return _SingleChipsEditorPresenter<T>();

      case SingleSegmentedEditor<T>():
        return _SingleSegmentedEditorPresenter<T>();

      default:
        return null;
    }
  }
}

class _SingleChipsEditorPresenter<TItem> extends ValueEditorPresenter<TItem> {
  const _SingleChipsEditorPresenter();

  @override
  Widget build(BuildContext context, ParamValue<TItem> value) {
    throw UnimplementedError();
  }
}

class _SingleSegmentedEditorPresenter<TItem>
    extends ValueEditorPresenter<TItem> {
  const _SingleSegmentedEditorPresenter();

  @override
  Widget build(BuildContext context, ParamValue<TItem> value) {
    throw UnimplementedError();
  }
}
