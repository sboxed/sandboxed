import 'package:flutter/src/widgets/framework.dart';
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

  test("params.multi() sets default chips editor", () {
    params.multi("id", [1, 2, 3]).required([1]);

    expect(params.get("id")?.value, [1]);
    expect(params.get("id")?.editor, isA<_MultiChipsEditorPresenter>());
  });

  test("segmented changes editor", () {
    params.multi("id", [1, 2, 3]).segmented().required([1]);

    expect(params.get("id")?.value, [1]);
    expect(params.get("id")?.editor, isA<_MultiSegmentedEditorPresenter>());
  });
}

class _ParamEditorFactory
    extends ParamEditorFactory<ValueEditorPresenter<dynamic>?> {
  const _ParamEditorFactory();

  @override
  ValueEditorPresenter<dynamic>? createListEditor<TItem>(
    ListParamEditor<TItem> e,
  ) {
    switch (e) {
      case MultiChipsEditor<TItem>():
        return _MultiChipsEditorPresenter<TItem>();

      case MultiSegmentedEditor<TItem>():
        return _MultiSegmentedEditorPresenter<TItem>();

      default:
        return null;
    }
  }

  @override
  ValueEditorPresenter? create<T>(ParamEditor e) {
    return null;
  }
}

class _MultiChipsEditorPresenter<TItem>
    extends ValueEditorPresenter<List<TItem>> {
  const _MultiChipsEditorPresenter();

  @override
  Widget build(BuildContext context, ParamValue<List<TItem>> value) {
    throw UnimplementedError();
  }
}

class _MultiSegmentedEditorPresenter<TItem>
    extends ValueEditorPresenter<List<TItem>> {
  const _MultiSegmentedEditorPresenter();

  @override
  Widget build(BuildContext context, ParamValue<List<TItem>> value) {
    throw UnimplementedError();
  }
}
