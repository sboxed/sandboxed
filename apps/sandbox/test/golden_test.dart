import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_core/story_view.dart';
import 'package:vibook_sandbox/widgets/button.dart';
import 'package:vibook_sandbox/widgets/button.stories.dart';

void main() {
  testStory(meta, $Blue);
  testStory(meta, $Green);
}

Future<void> testStory(Meta meta, Story story) async {
  testWidgets(
    'test ${meta.name} component with story - ${story.name}',
    (tester) async {
      await tester.pumpWidget(
        Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Material(
              child: StoryView(
                meta: meta,
                story: story,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ViButton),
        matchesGoldenFile('goldens/${meta.name}-${story.name}.png'),
      );
    },
  );
}
