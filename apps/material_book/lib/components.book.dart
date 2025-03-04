import 'package:material_book/widgets/bottom_app_bar.dart' as bottom_app_bar;
import 'package:material_book/widgets/bottom_navigation_bar.dart'
    as bottom_navigation_bar;
import 'package:vibook_core/component.dart';

get components => [
      Component(
        meta: () => bottom_navigation_bar.meta,
        stories: [
          () => bottom_navigation_bar.$Default,
        ],
      ),
      Component(
        meta: () => bottom_app_bar.meta,
        stories: [
          () => bottom_app_bar.$Default,
        ],
      ),
    ];
