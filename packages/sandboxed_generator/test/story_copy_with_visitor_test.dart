import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:sandboxed_generator/visitors/story_copy_with_visitor.dart';
import 'package:test/test.dart';

void main() {
  Set<String> overridesFor(String expression) {
    final unit = parseString(content: 'final story = $expression;').unit;
    final visitor = StoryCopyWithVisitor();
    unit.accept(visitor);

    return visitor.overrides;
  }

  test('generates a builder when the story has no builder argument', () {
    expect(overridesFor('Story(name: "Example")'), {'builder'});
  });

  test('preserves an explicit named builder argument', () {
    expect(
      overridesFor('Story(name: "Example", builder: (context) => widget)'),
      isEmpty,
    );
  });

  test('ignores arguments to other constructors', () {
    expect(overridesFor('Meta(name: "Example")'), isEmpty);
  });
}
