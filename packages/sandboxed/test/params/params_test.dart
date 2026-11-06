import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'requires an explicit list type in chained parameter calls',
    () {
      expect(
        () {
          final params = ParamStorage();
          final List<String> value = params.any('list').required([]);

          return value;
        },
        throwsA(isA<TypeError>()),
      );
    },
  );

  test(
    'test dynamic list explicit type param',
    () {
      expect(
        () {
          final params = ParamStorage();
          final List<String> _ =
              params //
                  .any<List<String>>('list')
                  .required([]);
        },
        returnsNormally,
      );
    },
    tags: ['lang-flaws'],
  );

  test(
    'test dynamic list can cast dynamic default value when hint provided',
    () {
      final params = ParamStorage();
      params.setInitialValues({
        'list': [],
      });

      List<String>? value;

      expect(
        () {
          value =
              params //
                  .any<List<String>>('list')
                  .required(['Some']);
        },
        returnsNormally,
      );

      expect(value, isNot(equals(['Some'])));
    },
    tags: ['lang-flaws'],
  );

  test(
    'test dynamic list fail',
    () {
      final params = ParamStorage();
      params.setInitialValues({
        'list': [],
      });

      List<String>? value;

      expect(
        () {
          value =
              params //
                  .any<List<String>>('list')
                  .optional();
        },
        throwsA(isA<TypeError>()),
      );

      expect(value, equals(null));
    },
    tags: ['lang-flaws'],
  );

  test('test dynamic boolean inference param', () {
    expect(
      () {
        final params = ParamStorage();
        final bool _ = params.any('boolean').required(false);
      },
      returnsNormally,
    );
  });

  test('test multi boolean inference param', () {
    expect(
      () {
        final params = ParamStorage();
        final List<String> _ = params
            .multi('multiList', ['string', 'bla'])
            .required([]);
      },
      returnsNormally,
    );
  });
}
