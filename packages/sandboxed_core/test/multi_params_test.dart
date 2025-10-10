import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ParamStorage params;

  setUp(() {
    params = ParamStorage();
  });

  test("params.multi() works", () {
    params.multi("id", [1, 2, 3]).required([1]);

    expect(params.get("id")?.value, [1]);
    expect(params.get("id")?.editor, isA<MultiChipsEditor>());
  });

  test("segmented changes editor", () {
    params.multi("id", [1, 2, 3]).segmented().required([1]);

    expect(params.get("id")?.value, [1]);
    expect(params.get("id")?.editor, isA<MultiSegmentedEditor>());
  });
}
