import 'package:flutter_test/flutter_test.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

void main() {
  // this test indicates that type can't be inferred in chained calls. so explicit type providing needed
  test(
    'test dynamic list inference param',
    () {
      expect(
        () {
          final params = ConstantParams();
          final List<String> _ = params.dynamic$('list').required([]);
        },
        throwsA(isA<TypeError>()),
      );
    },
    tags: ['lang-flaws'],
  );

  test(
    'test dynamic list explicit type param',
    () {
      expect(
        () {
          final params = ConstantParams();
          final List<String> _ = params //
              .dynamic$<List<String>, String, void>('list')
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
      final params = ConstantParams();
      params.updateDefaultValues({
        'list': [],
      });

      var value;

      expect(
        () {
          value = params //
              .dynamic$<List<String>, String, void>('list')
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
      final params = ConstantParams();
      params.updateDefaultValues({
        'list': [],
      });

      var value;

      expect(
        () {
          value = params //
              .dynamic$<List<String>, void, void>('list')
              .required(['Some']);
        },
        returnsNormally,
      );

      expect(value, equals(['Some']));
    },
    tags: ['lang-flaws'],
  );

  test('test dynamic boolean inference param', () {
    expect(
      () {
        final params = ConstantParams();
        final bool _ = params.dynamic$('boolean').required(false);
      },
      returnsNormally,
    );
  });

  test('test multi boolean inference param', () {
    expect(
      () {
        final params = ConstantParams();
        final List<String> _ =
            params.multi('multiList', ['string', 'bla']).required([]);
      },
      returnsNormally,
    );
  });
}
