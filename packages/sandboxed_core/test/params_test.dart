import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ParamStorage params;

  setUp(() {
    params = ParamStorage();
  });

  test("simple test", () {
    String value = params.string("id").required("value");

    expect(value, "value");
  });

  test("update later", () {
    String value = params.string("id").required("value");
    expect(value, "value");

    params.update("id", "new_value");
    value = params.string("id").required("other_value");

    expect(value, "new_value");
  });

  test("forbidden required after optional", () {
    params.string("id").optional("value");
    expect(() => params.string("id").required("value"), throwsException);
  });

  test("allowed optional after required", () {
    params.string("id").required("value");
    params.string("id").optional(null);
  });

  test("test param constraints", () {
    params.string("unconstrained").required("value");
    expect(() => params.update("unconstrained", ""), returnsNormally);

    params
        .string("constrained")
        .constrain((it) => it.isNotEmpty == true)
        .required("value");

    expect(() => params.update("constrained", ""), throwsArgumentError);
  });

  test("default value is applied instead of parameter", () {
    params.setInitialValues({"id": "default"});
    var value = params.string("id").required("value");

    expect(value, "default");

    params.update('id', "value");
    value = params.get("id")?.value;

    expect(value, "value");
  });

  test("reset works", () {
    params.string("id").required("value");
    params.update("id", "new_value");
    expect(params.get("id")?.value, equals("new_value"));

    params.reset();
    expect(params.get("id")?.value, equals("value"));
  });

  test("reset works with defaults", () {
    params.setInitialValues({"id": "default"});

    params.string("id").required("value");
    params.update("id", "new_value");
    expect(params.get("id")?.value, equals("new_value"));

    params.reset();
    expect(params.get("id")?.value, equals("default"));
  });

  test("slider param", () {
    final value = params.number("id").slider().required(0.5);

    expect(value, 0.5);

    // TODO(@melvspace): 10/10/25 render editor and test
  });

  test("multiple choice", () {
    final value = params.multi("id", ["a", "b", "c"]).required(["a", "b"]);

    expect(value, ["a", "b"]);

    expect(() => params.update("id", ["not_in_values"]), throwsArgumentError);
  });

  test("single choice", () {
    final value = params.single("id", ["a", "b", "c"]).required("a");

    expect(value, "a");

    expect(() => params.update("id", "not_in_values"), throwsArgumentError);
  });
}
