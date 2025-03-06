import 'package:vibook_core/vibook_core.dart';
import 'package:ui_kit/button.stories.dart' as button;

List<Component> get components => <Component>[
      Component(
        meta: button.meta.copyWith(
          documentation: [
            ...button.meta.documentation,
            DocumentEntry(name: 'Docs', content: '''["lib/button.stories.dart"]
'''),
          ],
        ),
        stories: [button.$Green, button.$Blue],
      )
    ];
