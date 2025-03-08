// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:material_book/widgets/bottom_app_bar.stories.dart' as _i1;
import 'package:material_book/widgets/bottom_navigation_bar.stories.dart'
    as _i2;
import 'package:flutter/src/material/bottom_navigation_bar.dart' as _i3;
import 'package:material_book/widgets/chips.stories.dart' as _i4;
import 'package:vibook_core/vibook_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
      Component(
        meta: _i1.meta.copyWith(documentation: [
          ..._i1.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A container that is typically used with [Scaffold.bottomNavigationBar].\n\nTypically used with a [Scaffold] and a [FloatingActionButton].\n\n```dart\nScaffold(\n  bottomNavigationBar: BottomAppBar(\n    color: Colors.white,\n    child: bottomAppBarContents,\n  ),\n  floatingActionButton: const FloatingActionButton(onPressed: null),\n)\n```\n\n{@tool dartpad}\nThis example shows the [BottomAppBar], which can be configured to have a notch using the\n[BottomAppBar.shape] property. This also includes an optional [FloatingActionButton], which illustrates\nthe [FloatingActionButtonLocation]s in relation to the [BottomAppBar].\n\n** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.1.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows Material 3 [BottomAppBar] with its expected look and behaviors.\n\nThis also includes an optional [FloatingActionButton], which illustrates\nthe [FloatingActionButtonLocation.endContained].\n\n** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.2.dart **\n{@end-tool}\n\nSee also:\n\n * [NotchedShape] which calculates the notch for a notched [BottomAppBar].\n * [FloatingActionButton] which the [BottomAppBar] makes a notch for.\n * [AppBar] for a toolbar that is shown at the top of the screen.\n',
          ),
        ]),
        stories: [
          _i1.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      Component(
        meta: _i2.meta.copyWith(documentation: [
          ..._i2.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A material widget that\'s displayed at the bottom of an app for selecting\namong a small number of views, typically between three and five.\n\nThere is an updated version of this component, [NavigationBar], that\'s\npreferred for new applications and applications that are configured\nfor Material 3 (see [ThemeData.useMaterial3]).\n\nThe bottom navigation bar consists of multiple items in the form of\ntext labels, icons, or both, laid out on top of a piece of material. It\nprovides quick navigation between the top-level views of an app. For larger\nscreens, side navigation may be a better fit.\n\nA bottom navigation bar is usually used in conjunction with a [Scaffold],\nwhere it is provided as the [Scaffold.bottomNavigationBar] argument.\n\nThe bottom navigation bar\'s [type] changes how its [items] are displayed.\nIf not specified, then it\'s automatically set to\n[BottomNavigationBarType.fixed] when there are less than four items, and\n[BottomNavigationBarType.shifting] otherwise.\n\nThe length of [items] must be at least two and each item\'s icon and\nlabel must not be null.\n\n * [BottomNavigationBarType.fixed], the default when there are less than\n   four [items]. The selected item is rendered with the\n   [selectedItemColor] if it\'s non-null, otherwise the theme\'s\n   [ColorScheme.primary] color is used for [Brightness.light] themes\n   and [ColorScheme.secondary] for [Brightness.dark] themes.\n   If [backgroundColor] is null, The\n   navigation bar\'s background color defaults to the [Material] background\n   color, [ThemeData.canvasColor] (essentially opaque white).\n * [BottomNavigationBarType.shifting], the default when there are four\n   or more [items]. If [selectedItemColor] is null, all items are rendered\n   in white. The navigation bar\'s background color is the same as the\n   [BottomNavigationBarItem.backgroundColor] of the selected item. In this\n   case it\'s assumed that each item will have a different background color\n   and that background color will contrast well with white.\n\n## Updating to [NavigationBar]\n\nThe [NavigationBar] widget\'s visuals\nare a little bit different, see the Material 3 spec at\n<https://m3.material.io/components/navigation-bar/overview> for\nmore details.\n\nThe [NavigationBar] widget\'s API is also slightly different.\nTo update from [BottomNavigationBar] to [NavigationBar], you will\nneed to make the following changes.\n\n1. Instead of using [BottomNavigationBar.items], which\ntakes a list of [BottomNavigationBarItem]s, use\n[NavigationBar.destinations], which takes a list of widgets.\nUsually, you use a list of [NavigationDestination] widgets.\nJust like [BottomNavigationBarItem]s, [NavigationDestination]s\nhave a label and icon field.\n\n2. Instead of using [BottomNavigationBar.onTap],\nuse [NavigationBar.onDestinationSelected], which is also\na callback that is called when the user taps on a\nnavigation bar item.\n\n3. Instead of using [BottomNavigationBar.currentIndex],\nuse [NavigationBar.selectedIndex], which is also an integer\nthat represents the index of the selected destination.\n\n4. You may also need to make changes to the styling of the\n[NavigationBar], see the properties in the [NavigationBar]\nconstructor for more details.\n\n## Using [BottomNavigationBar]\n\n{@tool dartpad}\nThis example shows a [BottomNavigationBar] as it is used within a [Scaffold]\nwidget. The [BottomNavigationBar] has three [BottomNavigationBarItem]\nwidgets, which means it defaults to [BottomNavigationBarType.fixed], and\nthe [currentIndex] is set to index 0. The selected item is\namber. The `_onItemTapped` function changes the selected item\'s index\nand displays a corresponding message in the center of the [Scaffold].\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.0.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows how you would migrate the above [BottomNavigationBar]\nto the new [NavigationBar].\n\n** See code in examples/api/lib/material/navigation_bar/navigation_bar.0.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows a [BottomNavigationBar] as it is used within a [Scaffold]\nwidget. The [BottomNavigationBar] has four [BottomNavigationBarItem]\nwidgets, which means it defaults to [BottomNavigationBarType.shifting], and\nthe [currentIndex] is set to index 0. The selected item is amber in color.\nWith each [BottomNavigationBarItem] widget, backgroundColor property is\nalso defined, which changes the background color of [BottomNavigationBar],\nwhen that item is selected. The `_onItemTapped` function changes the\nselected item\'s index and displays a corresponding message in the center of\nthe [Scaffold].\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.1.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows [BottomNavigationBar] used in a [Scaffold] Widget with\ndifferent interaction patterns. Tapping twice on the first [BottomNavigationBarItem]\nuses the [ScrollController] to animate the [ListView] to the top. The second\n[BottomNavigationBarItem] shows a Modal Dialog.\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.2.dart **\n{@end-tool}\nSee also:\n\n * [BottomNavigationBarItem]\n * [Scaffold]\n * <https://material.io/design/components/bottom-navigation.html>\n * [NavigationBar], this widget\'s replacement in Material Design 3.\n',
          ),
        ]),
        stories: [
          _i2.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i3.BottomNavigationBar(
              key: params.dynamic$(
                'key',
                null,
              ),
              items: params.dynamic$(
                'items',
                [],
              ),
              onTap: params.dynamic$(
                'onTap',
                null,
              ),
              currentIndex: params.dynamic$(
                'currentIndex',
                0,
              ),
              elevation: params.dynamic$(
                'elevation',
                null,
              ),
              type: params.dynamic$(
                'type',
                null,
              ),
              fixedColor: params.color(
                'fixedColor',
                Colors.red,
              ),
              backgroundColor: params.color(
                'backgroundColor',
                Colors.red,
              ),
              iconSize: params.dynamic$(
                'iconSize',
                24.0,
              ),
              selectedItemColor: params.color(
                'selectedItemColor',
                Colors.red,
              ),
              unselectedItemColor: params.color(
                'unselectedItemColor',
                Colors.red,
              ),
              selectedIconTheme: params.dynamic$(
                'selectedIconTheme',
                null,
              ),
              unselectedIconTheme: params.dynamic$(
                'unselectedIconTheme',
                null,
              ),
              selectedFontSize: params.dynamic$(
                'selectedFontSize',
                14.0,
              ),
              unselectedFontSize: params.dynamic$(
                'unselectedFontSize',
                12.0,
              ),
              selectedLabelStyle: params.dynamic$(
                'selectedLabelStyle',
                null,
              ),
              unselectedLabelStyle: params.dynamic$(
                'unselectedLabelStyle',
                null,
              ),
              showSelectedLabels: params.boolean(
                'showSelectedLabels',
                false,
              ),
              showUnselectedLabels: params.boolean(
                'showUnselectedLabels',
                false,
              ),
              mouseCursor: params.dynamic$(
                'mouseCursor',
                null,
              ),
              enableFeedback: params.boolean(
                'enableFeedback',
                false,
              ),
              landscapeLayout: params.dynamic$(
                'landscapeLayout',
                null,
              ),
              useLegacyColorScheme: params.boolean(
                'useLegacyColorScheme',
                true,
              ),
            ),
          )
        ],
      ),
      Component(
        meta: _i4.meta.copyWith(documentation: [
          ..._i4.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A Material Design chip.\n\nChips are compact elements that represent an attribute, text, entity, or\naction.\n\nSupplying a non-null [onDeleted] callback will cause the chip to include a\nbutton for deleting the chip.\n\nIts ancestors must include [Material], [MediaQuery], [Directionality], and\n[MaterialLocalizations]. Typically all of these widgets are provided by\n[MaterialApp] and [Scaffold]. The [label] and [clipBehavior] arguments must\nnot be null.\n\n\n```dart\nChip(\n  avatar: CircleAvatar(\n    backgroundColor: Colors.grey.shade800,\n    child: const Text(\'AB\'),\n  ),\n  label: const Text(\'Aaron Burr\'),\n)\n```\n\nSee also:\n\n * [InputChip], a chip that represents a complex piece of information, such\n   as an entity (person, place, or thing) or conversational text, in a\n   compact form.\n * [ChoiceChip], allows a single selection from a set of options. Choice\n   chips contain related descriptive text or categories.\n * [FilterChip], uses tags or descriptive words as a way to filter content.\n * [ActionChip], represents an action related to primary content.\n * [CircleAvatar], which shows images or initials of entities.\n * [Wrap], A widget that displays its children in multiple horizontal or\n   vertical runs.\n * <https://material.io/design/components/chips.html>\n',
          ),
        ]),
        stories: [
          _i4.$Chip.applyGenerated(
            name: 'Chip',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _i4.$InputChip.applyGenerated(
            name: 'Input Chip',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _i4.$ChoiceChip.applyGenerated(
            name: 'Choice Chip',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _i4.$FilterChip.applyGenerated(
            name: 'Filter Chip',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _i4.$ActionChip.applyGenerated(
            name: 'Action Chip',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `clipBehavior` of type [Clip]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
