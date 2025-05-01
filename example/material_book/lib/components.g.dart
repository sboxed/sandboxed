// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:material_book/widgets/app_bar.stories.dart' as _i1;
import 'package:flutter/src/material/app_bar.dart' as _i2;
import 'package:flutter/src/widgets/framework.dart' as _i3;
import 'package:flutter/src/widgets/preferred_size.dart' as _i4;
import 'package:flutter/src/widgets/scroll_notification.dart' as _i5;
import 'package:flutter/src/painting/borders.dart' as _i6;
import 'package:flutter/src/widgets/icon_theme_data.dart' as _i7;
import 'package:flutter/src/painting/text_style.dart' as _i8;
import 'package:flutter/src/services/system_chrome.dart' as _i9;
import 'dart:ui' as _i10;
import 'package:material_book/widgets/bottom_app_bar.stories.dart' as _i11;
import 'package:flutter/src/material/bottom_app_bar.dart' as _i12;
import 'package:flutter/src/painting/notched_shapes.dart' as _i13;
import 'package:flutter/src/painting/edge_insets.dart' as _i14;
import 'package:material_book/widgets/bottom_navigation_bar.stories.dart'
    as _i15;
import 'package:flutter/src/material/bottom_navigation_bar.dart' as _i16;
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart' as _i17;
import 'package:flutter/src/services/mouse_cursor.dart' as _i18;
import 'package:material_book/widgets/card.stories.dart' as _i19;
import 'package:flutter/src/material/card.dart' as _i20;
import 'package:material_book/widgets/chips.stories.dart' as _i21;
import 'package:flutter/src/material/chip.dart' as _i22;
import 'package:flutter/src/widgets/focus_manager.dart' as _i23;
import 'package:flutter/src/material/material_state.dart' as _i24;
import 'package:flutter/src/material/theme_data.dart' as _i25;
import 'package:flutter/src/rendering/box.dart' as _i26;
import 'package:material_book/widgets/scaffold.stories.dart' as _i27;
import 'package:flutter/src/material/scaffold.dart' as _i28;
import 'package:flutter/src/material/floating_action_button_location.dart'
    as _i29;
import 'package:flutter/src/painting/alignment.dart' as _i30;
import 'package:flutter/src/gestures/recognizer.dart' as _i31;
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
      Component(
        meta: _i1.meta.copyWith(documentation: [
          ..._i1.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A Material Design app bar.\n\nAn app bar consists of a toolbar and potentially other widgets, such as a\n[TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more\ncommon [actions] with [IconButton]s which are optionally followed by a\n[PopupMenuButton] for less common operations (sometimes called the "overflow\nmenu").\n\nApp bars are typically used in the [Scaffold.appBar] property, which places\nthe app bar as a fixed-height widget at the top of the screen. For a scrollable\napp bar, see [SliverAppBar], which embeds an [AppBar] in a sliver for use in\na [CustomScrollView].\n\nThe AppBar displays the toolbar widgets, [leading], [title], and [actions],\nabove the [bottom] (if any). The [bottom] is usually used for a [TabBar]. If\na [flexibleSpace] widget is specified then it is stacked behind the toolbar\nand the bottom widget. The following diagram shows where each of these slots\nappears in the toolbar when the writing language is left-to-right (e.g.\nEnglish):\n\nThe [AppBar] insets its content based on the ambient [MediaQuery]\'s padding,\nto avoid system UI intrusions. It\'s taken care of by [Scaffold] when used in\nthe [Scaffold.appBar] property. When animating an [AppBar], unexpected\n[MediaQuery] changes (as is common in [Hero] animations) may cause the content\nto suddenly jump. Wrap the [AppBar] in a [MediaQuery] widget, and adjust its\npadding such that the animation is smooth.\n\n![The leading widget is in the top left, the actions are in the top right,\nthe title is between them. The bottom is, naturally, at the bottom, and the\nflexibleSpace is behind all of them.](https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png)\n\nIf the [leading] widget is omitted, but the [AppBar] is in a [Scaffold] with\na [Drawer], then a button will be inserted to open the drawer. Otherwise, if\nthe nearest [Navigator] has any previous routes, a [BackButton] is inserted\ninstead. This behavior can be turned off by setting the [automaticallyImplyLeading]\nto false. In that case a null leading widget will result in the middle/title widget\nstretching to start.\n\n{@tool dartpad}\nThis sample shows an [AppBar] with two simple actions. The first action\nopens a [SnackBar], while the second action navigates to a new page.\n\n** See code in examples/api/lib/material/app_bar/app_bar.0.dart **\n{@end-tool}\n\nMaterial Design 3 introduced new types of app bar.\n{@tool dartpad}\nThis sample shows the creation of an [AppBar] widget with the [shadowColor] and\n[scrolledUnderElevation] properties set, as described in:\nhttps://m3.material.io/components/top-app-bar/overview\n\n** See code in examples/api/lib/material/app_bar/app_bar.1.dart **\n{@end-tool}\n\n## Troubleshooting\n\n### Why don\'t my TextButton actions appear?\n\nIf the app bar\'s [actions] contains [TextButton]s, they will not\nbe visible if their foreground (text) color is the same as the\napp bar\'s background color.\n\nIn Material v2 (i.e., when [ThemeData.useMaterial3] is false),\nthe default app bar [backgroundColor] is the overall theme\'s\n[ColorScheme.primary] if the overall theme\'s brightness is\n[Brightness.light]. Unfortunately this is the same as the default\n[ButtonStyle.foregroundColor] for [TextButton] for light themes.\nIn this case a preferable text button foreground color is\n[ColorScheme.onPrimary], a color that contrasts nicely with\n[ColorScheme.primary]. To remedy the problem, override\n[TextButton.style]:\n\n{@tool dartpad}\nThis sample shows an [AppBar] with two action buttons with their primary\ncolor set to [ColorScheme.onPrimary].\n\n** See code in examples/api/lib/material/app_bar/app_bar.2.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows how to listen to a nested Scrollable\'s scroll notification\nin a nested scroll view using the [notificationPredicate] property and use it\nto make [scrolledUnderElevation] take effect.\n\n** See code in examples/api/lib/material/app_bar/app_bar.3.dart **\n{@end-tool}\n\nSee also:\n\n * [Scaffold], which displays the [AppBar] in its [Scaffold.appBar] slot.\n * [SliverAppBar], which uses [AppBar] to provide a flexible app bar that\n   can be used in a [CustomScrollView].\n * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]\n   if the screen has multiple pages arranged in tabs.\n * [IconButton], which is used with [actions] to show buttons on the app bar.\n * [PopupMenuButton], to show a popup menu on the app bar, via [actions].\n * [FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar\n   can expand and collapse.\n * <https://material.io/design/components/app-bars-top.html>\n * <https://m3.material.io/components/top-app-bar>\n * Cookbook: [Place a floating app bar above a list](https://docs.flutter.dev/cookbook/lists/floating-app-bar)\n',
          ),
        ]),
        stories: [
          _i1.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i2.AppBar(
              key: null,
              leading: params.dynamic$<_i3.Widget>(r'leading').optional(null),
              automaticallyImplyLeading:
                  params.boolean(r'automaticallyImplyLeading').required(true),
              title: params.dynamic$<_i3.Widget>(r'title').optional(null),
              actions:
                  params.dynamic$<List<_i3.Widget>>(r'actions').optional(null),
              flexibleSpace:
                  params.dynamic$<_i3.Widget>(r'flexibleSpace').optional(null),
              bottom: params
                  .dynamic$<_i4.PreferredSizeWidget>(r'bottom')
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              scrolledUnderElevation:
                  params.number(r'scrolledUnderElevation').optional(null),
              notificationPredicate: params
                  .dynamic$<bool Function(_i5.ScrollNotification)>(
                      r'notificationPredicate')
                  .required(defaultScrollNotificationPredicate),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              shape: params.dynamic$<_i6.ShapeBorder>(r'shape').optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              foregroundColor: params.color(r'foregroundColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              actionsIconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'actionsIconTheme')
                  .optional(null),
              primary: params.boolean(r'primary').required(true),
              centerTitle: params.boolean(r'centerTitle').optional(null),
              excludeHeaderSemantics:
                  params.boolean(r'excludeHeaderSemantics').required(false),
              titleSpacing: params.number(r'titleSpacing').optional(null),
              toolbarOpacity: params.number(r'toolbarOpacity').required(1.0),
              bottomOpacity: params.number(r'bottomOpacity').required(1.0),
              toolbarHeight: params.number(r'toolbarHeight').optional(null),
              leadingWidth: params.number(r'leadingWidth').optional(null),
              toolbarTextStyle: params
                  .dynamic$<_i8.TextStyle>(r'toolbarTextStyle')
                  .optional(null),
              titleTextStyle: params
                  .dynamic$<_i8.TextStyle>(r'titleTextStyle')
                  .optional(null),
              systemOverlayStyle: params
                  .dynamic$<_i9.SystemUiOverlayStyle>(r'systemOverlayStyle')
                  .optional(null),
              forceMaterialTransparency:
                  params.boolean(r'forceMaterialTransparency').required(false),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .optional(null),
            ),
          )
        ],
      ),
      Component(
        meta: _i11.meta.copyWith(documentation: [
          ..._i11.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A container that is typically used with [Scaffold.bottomNavigationBar].\n\nTypically used with a [Scaffold] and a [FloatingActionButton].\n\n```dart\nScaffold(\n  bottomNavigationBar: BottomAppBar(\n    color: Colors.white,\n    child: bottomAppBarContents,\n  ),\n  floatingActionButton: const FloatingActionButton(onPressed: null),\n)\n```\n\n{@tool dartpad}\nThis example shows the [BottomAppBar], which can be configured to have a notch using the\n[BottomAppBar.shape] property. This also includes an optional [FloatingActionButton], which illustrates\nthe [FloatingActionButtonLocation]s in relation to the [BottomAppBar].\n\n** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.1.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows Material 3 [BottomAppBar] with its expected look and behaviors.\n\nThis also includes an optional [FloatingActionButton], which illustrates\nthe [FloatingActionButtonLocation.endContained].\n\n** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.2.dart **\n{@end-tool}\n\nSee also:\n\n * [NotchedShape] which calculates the notch for a notched [BottomAppBar].\n * [FloatingActionButton] which the [BottomAppBar] makes a notch for.\n * [AppBar] for a toolbar that is shown at the top of the screen.\n',
          ),
        ]),
        stories: [
          _i11.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i12.BottomAppBar(
              key: null,
              color: params.color(r'color').optional(null),
              elevation: params.number(r'elevation').optional(null),
              shape:
                  params.dynamic$<_i13.NotchedShape>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              notchMargin: params.number(r'notchMargin').required(4.0),
              child: params.dynamic$<_i3.Widget>(r'child').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              height: params.number(r'height').optional(null),
            ),
          )
        ],
      ),
      Component(
        meta: _i15.meta.copyWith(documentation: [
          ..._i15.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A material widget that\'s displayed at the bottom of an app for selecting\namong a small number of views, typically between three and five.\n\nThere is an updated version of this component, [NavigationBar], that\'s\npreferred for new applications and applications that are configured\nfor Material 3 (see [ThemeData.useMaterial3]).\n\nThe bottom navigation bar consists of multiple items in the form of\ntext labels, icons, or both, laid out on top of a piece of material. It\nprovides quick navigation between the top-level views of an app. For larger\nscreens, side navigation may be a better fit.\n\nA bottom navigation bar is usually used in conjunction with a [Scaffold],\nwhere it is provided as the [Scaffold.bottomNavigationBar] argument.\n\nThe bottom navigation bar\'s [type] changes how its [items] are displayed.\nIf not specified, then it\'s automatically set to\n[BottomNavigationBarType.fixed] when there are less than four items, and\n[BottomNavigationBarType.shifting] otherwise.\n\nThe length of [items] must be at least two and each item\'s icon and\nlabel must not be null.\n\n * [BottomNavigationBarType.fixed], the default when there are less than\n   four [items]. The selected item is rendered with the\n   [selectedItemColor] if it\'s non-null, otherwise the theme\'s\n   [ColorScheme.primary] color is used for [Brightness.light] themes\n   and [ColorScheme.secondary] for [Brightness.dark] themes.\n   If [backgroundColor] is null, The\n   navigation bar\'s background color defaults to the [Material] background\n   color, [ThemeData.canvasColor] (essentially opaque white).\n * [BottomNavigationBarType.shifting], the default when there are four\n   or more [items]. If [selectedItemColor] is null, all items are rendered\n   in white. The navigation bar\'s background color is the same as the\n   [BottomNavigationBarItem.backgroundColor] of the selected item. In this\n   case it\'s assumed that each item will have a different background color\n   and that background color will contrast well with white.\n\n## Updating to [NavigationBar]\n\nThe [NavigationBar] widget\'s visuals\nare a little bit different, see the Material 3 spec at\n<https://m3.material.io/components/navigation-bar/overview> for\nmore details.\n\nThe [NavigationBar] widget\'s API is also slightly different.\nTo update from [BottomNavigationBar] to [NavigationBar], you will\nneed to make the following changes.\n\n1. Instead of using [BottomNavigationBar.items], which\ntakes a list of [BottomNavigationBarItem]s, use\n[NavigationBar.destinations], which takes a list of widgets.\nUsually, you use a list of [NavigationDestination] widgets.\nJust like [BottomNavigationBarItem]s, [NavigationDestination]s\nhave a label and icon field.\n\n2. Instead of using [BottomNavigationBar.onTap],\nuse [NavigationBar.onDestinationSelected], which is also\na callback that is called when the user taps on a\nnavigation bar item.\n\n3. Instead of using [BottomNavigationBar.currentIndex],\nuse [NavigationBar.selectedIndex], which is also an integer\nthat represents the index of the selected destination.\n\n4. You may also need to make changes to the styling of the\n[NavigationBar], see the properties in the [NavigationBar]\nconstructor for more details.\n\n## Using [BottomNavigationBar]\n\n{@tool dartpad}\nThis example shows a [BottomNavigationBar] as it is used within a [Scaffold]\nwidget. The [BottomNavigationBar] has three [BottomNavigationBarItem]\nwidgets, which means it defaults to [BottomNavigationBarType.fixed], and\nthe [currentIndex] is set to index 0. The selected item is\namber. The `_onItemTapped` function changes the selected item\'s index\nand displays a corresponding message in the center of the [Scaffold].\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.0.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows how you would migrate the above [BottomNavigationBar]\nto the new [NavigationBar].\n\n** See code in examples/api/lib/material/navigation_bar/navigation_bar.0.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows a [BottomNavigationBar] as it is used within a [Scaffold]\nwidget. The [BottomNavigationBar] has four [BottomNavigationBarItem]\nwidgets, which means it defaults to [BottomNavigationBarType.shifting], and\nthe [currentIndex] is set to index 0. The selected item is amber in color.\nWith each [BottomNavigationBarItem] widget, backgroundColor property is\nalso defined, which changes the background color of [BottomNavigationBar],\nwhen that item is selected. The `_onItemTapped` function changes the\nselected item\'s index and displays a corresponding message in the center of\nthe [Scaffold].\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.1.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows [BottomNavigationBar] used in a [Scaffold] Widget with\ndifferent interaction patterns. Tapping twice on the first [BottomNavigationBarItem]\nuses the [ScrollController] to animate the [ListView] to the top. The second\n[BottomNavigationBarItem] shows a Modal Dialog.\n\n** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.2.dart **\n{@end-tool}\nSee also:\n\n * [BottomNavigationBarItem]\n * [Scaffold]\n * <https://material.io/design/components/bottom-navigation.html>\n * [NavigationBar], this widget\'s replacement in Material Design 3.\n',
          ),
        ]),
        stories: [
          _i15.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i16.BottomNavigationBar(
              key: null,
              items: params
                  .dynamic$<List<_i17.BottomNavigationBarItem>>(r'items')
                  .required([]),
              onTap:
                  params.dynamic$<void Function(int)>(r'onTap').optional(null),
              currentIndex: params.integer(r'currentIndex').required(0),
              elevation: params.number(r'elevation').optional(null),
              type: params
                  .single(
                    r'type',
                    _i16.BottomNavigationBarType.values,
                  )
                  .optional(null),
              fixedColor: params.color(r'fixedColor').optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              iconSize: params.number(r'iconSize').required(24.0),
              selectedItemColor:
                  params.color(r'selectedItemColor').optional(null),
              unselectedItemColor:
                  params.color(r'unselectedItemColor').optional(null),
              selectedIconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'selectedIconTheme')
                  .optional(null),
              unselectedIconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'unselectedIconTheme')
                  .optional(null),
              selectedFontSize:
                  params.number(r'selectedFontSize').required(14.0),
              unselectedFontSize:
                  params.number(r'unselectedFontSize').required(12.0),
              selectedLabelStyle: params
                  .dynamic$<_i8.TextStyle>(r'selectedLabelStyle')
                  .optional(null),
              unselectedLabelStyle: params
                  .dynamic$<_i8.TextStyle>(r'unselectedLabelStyle')
                  .optional(null),
              showSelectedLabels:
                  params.boolean(r'showSelectedLabels').optional(null),
              showUnselectedLabels:
                  params.boolean(r'showUnselectedLabels').optional(null),
              mouseCursor: params
                  .dynamic$<_i18.MouseCursor>(r'mouseCursor')
                  .optional(null),
              enableFeedback: params.boolean(r'enableFeedback').optional(null),
              landscapeLayout: params
                  .single(
                    r'landscapeLayout',
                    _i16.BottomNavigationBarLandscapeLayout.values,
                  )
                  .optional(null),
              useLegacyColorScheme:
                  params.boolean(r'useLegacyColorScheme').required(true),
            ),
          )
        ],
      ),
      Component(
        meta: _i19.meta,
        stories: [
          _i19.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i20.Card(
              key: null,
              color: params.color(r'color').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              elevation: params.number(r'elevation').optional(null),
              shape: params.dynamic$<_i6.ShapeBorder>(r'shape').optional(null),
              borderOnForeground:
                  params.boolean(r'borderOnForeground').required(true),
              margin: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'margin')
                  .optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .optional(null),
              child: params.dynamic$<_i3.Widget>(r'child').optional(null),
              semanticContainer:
                  params.boolean(r'semanticContainer').required(true),
            ),
          ),
          _i19.$Nested.applyGenerated(
            name: 'Nested',
            builder: (
              context,
              params,
            ) =>
                _i20.Card(
              key: null,
              color: params.color(r'color').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              elevation: params.number(r'elevation').optional(null),
              shape: params.dynamic$<_i6.ShapeBorder>(r'shape').optional(null),
              borderOnForeground:
                  params.boolean(r'borderOnForeground').required(true),
              margin: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'margin')
                  .optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .optional(null),
              child: params.dynamic$<_i3.Widget>(r'child').optional(null),
              semanticContainer:
                  params.boolean(r'semanticContainer').required(true),
            ),
          ),
        ],
      ),
      Component(
        meta: _i21.meta.copyWith(documentation: [
          ..._i21.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A Material Design chip.\n\nChips are compact elements that represent an attribute, text, entity, or\naction.\n\nSupplying a non-null [onDeleted] callback will cause the chip to include a\nbutton for deleting the chip.\n\nIts ancestors must include [Material], [MediaQuery], [Directionality], and\n[MaterialLocalizations]. Typically all of these widgets are provided by\n[MaterialApp] and [Scaffold]. The [label] and [clipBehavior] arguments must\nnot be null.\n\n\n```dart\nChip(\n  avatar: CircleAvatar(\n    backgroundColor: Colors.grey.shade800,\n    child: const Text(\'AB\'),\n  ),\n  label: const Text(\'Aaron Burr\'),\n)\n```\n\nSee also:\n\n * [InputChip], a chip that represents a complex piece of information, such\n   as an entity (person, place, or thing) or conversational text, in a\n   compact form.\n * [ChoiceChip], allows a single selection from a set of options. Choice\n   chips contain related descriptive text or categories.\n * [FilterChip], uses tags or descriptive words as a way to filter content.\n * [ActionChip], represents an action related to primary content.\n * [CircleAvatar], which shows images or initials of entities.\n * [Wrap], A widget that displays its children in multiple horizontal or\n   vertical runs.\n * <https://material.io/design/components/chips.html>\n',
          ),
        ]),
        stories: [
          _i21.$ActionChip.applyGenerated(
            name: 'Action Chip',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
          _i21.$Chip.applyGenerated(
            name: 'Chip',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
          _i21.$ChoiceChip.applyGenerated(
            name: 'Choice Chip',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
          _i21.$FilterChip.applyGenerated(
            name: 'Filter Chip',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
          _i21.$InputChip.applyGenerated(
            name: 'Input Chip',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
          _i21.$Playground.applyGenerated(
            name: 'Playground',
            builder: (
              context,
              params,
            ) =>
                _i22.Chip(
              key: null,
              avatar: params.dynamic$<_i3.Widget>(r'avatar').optional(null),
              label: params
                  .dynamic$<_i3.Widget>(r'label')
                  .required(const SizedBox.shrink()),
              labelStyle:
                  params.dynamic$<_i8.TextStyle>(r'labelStyle').optional(null),
              labelPadding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'labelPadding')
                  .optional(null),
              deleteIcon:
                  params.dynamic$<_i3.Widget>(r'deleteIcon').optional(null),
              onDeleted:
                  params.dynamic$<void Function()>(r'onDeleted').optional(null),
              deleteIconColor: params.color(r'deleteIconColor').optional(null),
              deleteButtonTooltipMessage:
                  params.string(r'deleteButtonTooltipMessage').optional(null),
              side: params.dynamic$<_i6.BorderSide>(r'side').optional(null),
              shape:
                  params.dynamic$<_i6.OutlinedBorder>(r'shape').optional(null),
              clipBehavior: params
                  .single(
                    r'clipBehavior',
                    _i10.Clip.values,
                  )
                  .required(_i10.Clip.none),
              focusNode:
                  params.dynamic$<_i23.FocusNode>(r'focusNode').optional(null),
              autofocus: params.boolean(r'autofocus').required(false),
              color: params
                  .dynamic$<_i24.MaterialStateProperty<_i10.Color?>>(r'color')
                  .optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              padding: params
                  .dynamic$<_i14.EdgeInsetsGeometry>(r'padding')
                  .optional(null),
              visualDensity: params
                  .dynamic$<_i25.VisualDensity>(r'visualDensity')
                  .optional(null),
              materialTapTargetSize: params
                  .single(
                    r'materialTapTargetSize',
                    _i25.MaterialTapTargetSize.values,
                  )
                  .optional(null),
              elevation: params.number(r'elevation').optional(null),
              shadowColor: params.color(r'shadowColor').optional(null),
              surfaceTintColor:
                  params.color(r'surfaceTintColor').optional(null),
              iconTheme: params
                  .dynamic$<_i7.IconThemeData>(r'iconTheme')
                  .optional(null),
              avatarBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'avatarBoxConstraints')
                  .optional(null),
              deleteIconBoxConstraints: params
                  .dynamic$<_i26.BoxConstraints>(r'deleteIconBoxConstraints')
                  .optional(null),
              chipAnimationStyle: params
                  .dynamic$<_i22.ChipAnimationStyle>(r'chipAnimationStyle')
                  .optional(null),
            ),
          ),
        ],
      ),
      Component(
        meta: _i27.meta.copyWith(documentation: [
          ..._i27.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'Implements the basic Material Design visual layout structure.\n\nThis class provides APIs for showing drawers and bottom sheets.\n\nTo display a persistent bottom sheet, obtain the\n[ScaffoldState] for the current [BuildContext] via [Scaffold.of] and use the\n[ScaffoldState.showBottomSheet] function.\n\n{@tool dartpad}\nThis example shows a [Scaffold] with a [body] and [FloatingActionButton].\nThe [body] is a [Text] placed in a [Center] in order to center the text\nwithin the [Scaffold]. The [FloatingActionButton] is connected to a\ncallback that increments a counter.\n\n** See code in examples/api/lib/material/scaffold/scaffold.0.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows a [Scaffold] with a blueGrey [backgroundColor], [body]\nand [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in\norder to center the text within the [Scaffold]. The [FloatingActionButton]\nis connected to a callback that increments a counter.\n\n![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_background_color.png)\n\n** See code in examples/api/lib/material/scaffold/scaffold.1.dart **\n{@end-tool}\n\n{@tool dartpad}\nThis example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a\n[FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order\nto center the text within the [Scaffold]. The [FloatingActionButton] is\ncentered and docked within the [BottomAppBar] using\n[FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is\nconnected to a callback that increments a counter.\n\n![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_bottom_app_bar.png)\n\n** See code in examples/api/lib/material/scaffold/scaffold.2.dart **\n{@end-tool}\n\n## Scaffold layout, the keyboard, and display "notches"\n\nThe scaffold will expand to fill the available space. That usually\nmeans that it will occupy its entire window or device screen. When\nthe device\'s keyboard appears the Scaffold\'s ancestor [MediaQuery]\nwidget\'s [MediaQueryData.viewInsets] changes and the Scaffold will\nbe rebuilt. By default the scaffold\'s [body] is resized to make\nroom for the keyboard. To prevent the resize set\n[resizeToAvoidBottomInset] to false. In either case the focused\nwidget will be scrolled into view if it\'s within a scrollable\ncontainer.\n\nThe [MediaQueryData.padding] value defines areas that might\nnot be completely visible, like the display "notch" on the iPhone\nX. The scaffold\'s [body] is not inset by this padding value\nalthough an [appBar] or [bottomNavigationBar] will typically\ncause the body to avoid the padding. The [SafeArea]\nwidget can be used within the scaffold\'s body to avoid areas\nlike display notches.\n\n## Floating action button with a draggable scrollable bottom sheet\n\nIf [Scaffold.bottomSheet] is a [DraggableScrollableSheet],\n[Scaffold.floatingActionButton] is set, and the bottom sheet is dragged to\ncover greater than 70% of the Scaffold\'s height, two things happen in parallel:\n\n  * Scaffold starts to show scrim (see [ScaffoldState.showBodyScrim]), and\n  * [Scaffold.floatingActionButton] is scaled down through an animation with a [Curves.easeIn], and\n    disappears when the bottom sheet covers the entire Scaffold.\n\nAnd as soon as the bottom sheet is dragged down to cover less than 70% of the [Scaffold], the scrim\ndisappears and [Scaffold.floatingActionButton] animates back to its normal size.\n\n## Troubleshooting\n\n### Nested Scaffolds\n\nThe Scaffold is designed to be a top level container for\na [MaterialApp]. This means that adding a Scaffold\nto each route on a Material app will provide the app with\nMaterial\'s basic visual layout structure.\n\nIt is typically not necessary to nest Scaffolds. For example, in a\ntabbed UI, where the [bottomNavigationBar] is a [TabBar]\nand the body is a [TabBarView], you might be tempted to make each tab bar\nview a scaffold with a differently titled AppBar. Rather, it would be\nbetter to add a listener to the [TabController] that updates the\nAppBar\n\nAdd a listener to the app\'s tab controller so that the [AppBar] title of the\napp\'s one and only scaffold is reset each time a new tab is selected.\n\n```dart\nTabController(vsync: tickerProvider, length: tabCount)..addListener(() {\n  if (!tabController.indexIsChanging) {\n    setState(() {\n      // Rebuild the enclosing scaffold with a new AppBar title\n      appBarTitle = \'Tab \${tabController.index}\';\n    });\n  }\n})\n```\n\nAlthough there are some use cases, like a presentation app that\nshows embedded flutter content, where nested scaffolds are\nappropriate, it\'s best to avoid nesting scaffolds.\n\nSee also:\n\n * [AppBar], which is a horizontal bar typically shown at the top of an app\n   using the [appBar] property.\n * [BottomAppBar], which is a horizontal bar typically shown at the bottom\n   of an app using the [bottomNavigationBar] property.\n * [FloatingActionButton], which is a circular button typically shown in the\n   bottom right corner of the app using the [floatingActionButton] property.\n * [Drawer], which is a vertical panel that is typically displayed to the\n   left of the body (and often hidden on phones) using the [drawer]\n   property.\n * [BottomNavigationBar], which is a horizontal array of buttons typically\n   shown along the bottom of the app using the [bottomNavigationBar]\n   property.\n * [BottomSheet], which is an overlay typically shown near the bottom of the\n   app. A bottom sheet can either be persistent, in which case it is shown\n   using the [ScaffoldState.showBottomSheet] method, or modal, in which case\n   it is shown using the [showModalBottomSheet] function.\n * [SnackBar], which is a lightweight message with an optional action which\n   briefly displays at the bottom of the screen. Use the\n   [ScaffoldMessengerState.showSnackBar] method to show snack bars.\n * [MaterialBanner], which displays an important, succinct message, at the\n   top of the screen, below the app bar. Use the\n   [ScaffoldMessengerState.showMaterialBanner] method to show material banners.\n * [ScaffoldState], which is the state associated with this widget.\n * <https://material.io/design/layout/responsive-layout-grid.html>\n * Cookbook: [Add a Drawer to a screen](https://docs.flutter.dev/cookbook/design/drawer)\n',
          ),
        ]),
        stories: [
          _i27.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i28.Scaffold(
              key: null,
              appBar: params
                  .dynamic$<_i4.PreferredSizeWidget>(r'appBar')
                  .optional(null),
              body: params.dynamic$<_i3.Widget>(r'body').optional(null),
              floatingActionButton: params
                  .dynamic$<_i3.Widget>(r'floatingActionButton')
                  .optional(null),
              floatingActionButtonLocation: params
                  .dynamic$<_i29.FloatingActionButtonLocation>(
                      r'floatingActionButtonLocation')
                  .optional(null),
              floatingActionButtonAnimator: params
                  .dynamic$<_i29.FloatingActionButtonAnimator>(
                      r'floatingActionButtonAnimator')
                  .optional(null),
              persistentFooterButtons: params
                  .dynamic$<List<_i3.Widget>>(r'persistentFooterButtons')
                  .optional(null),
              persistentFooterAlignment: params
                  .dynamic$<_i30.AlignmentDirectional>(
                      r'persistentFooterAlignment')
                  .required(AlignmentDirectional.centerEnd),
              drawer: params.dynamic$<_i3.Widget>(r'drawer').optional(null),
              onDrawerChanged: params
                  .dynamic$<void Function(bool)>(r'onDrawerChanged')
                  .optional(null),
              endDrawer:
                  params.dynamic$<_i3.Widget>(r'endDrawer').optional(null),
              onEndDrawerChanged: params
                  .dynamic$<void Function(bool)>(r'onEndDrawerChanged')
                  .optional(null),
              bottomNavigationBar: params
                  .dynamic$<_i3.Widget>(r'bottomNavigationBar')
                  .optional(null),
              bottomSheet:
                  params.dynamic$<_i3.Widget>(r'bottomSheet').optional(null),
              backgroundColor: params.color(r'backgroundColor').optional(null),
              resizeToAvoidBottomInset:
                  params.boolean(r'resizeToAvoidBottomInset').optional(null),
              primary: params.boolean(r'primary').required(true),
              drawerDragStartBehavior: params
                  .single(
                    r'drawerDragStartBehavior',
                    _i31.DragStartBehavior.values,
                  )
                  .required(_i31.DragStartBehavior.start),
              extendBody: params.boolean(r'extendBody').required(false),
              extendBodyBehindAppBar:
                  params.boolean(r'extendBodyBehindAppBar').required(false),
              drawerScrimColor:
                  params.color(r'drawerScrimColor').optional(null),
              drawerEdgeDragWidth:
                  params.number(r'drawerEdgeDragWidth').optional(null),
              drawerEnableOpenDragGesture:
                  params.boolean(r'drawerEnableOpenDragGesture').required(true),
              endDrawerEnableOpenDragGesture: params
                  .boolean(r'endDrawerEnableOpenDragGesture')
                  .required(true),
              restorationId: params.string(r'restorationId').optional(null),
            ),
          )
        ],
      ),
    ];
