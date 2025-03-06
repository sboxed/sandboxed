import 'package:vibook_core/vibook_core.dart';
import 'package:material_book/widgets/bottom_app_bar.stories.dart'
    as widgets_bottom_app_bar;
import 'package:material_book/widgets/bottom_navigation_bar.stories.dart'
    as widgets_bottom_navigation_bar;
import 'package:material_book/widgets/chips.stories.dart' as widgets_chips;

List<Component> get components => <Component>[
      Component(
        meta: widgets_bottom_app_bar.meta.copyWith(
          documentation: [
            ...widgets_bottom_app_bar.meta.documentation,
            DocumentEntry(
                name: 'Docs',
                content:
                    '''A container that is typically used with [Scaffold.bottomNavigationBar].

Typically used with a [Scaffold] and a [FloatingActionButton].

```dart
Scaffold(
  bottomNavigationBar: BottomAppBar(
    color: Colors.white,
    child: bottomAppBarContents,
  ),
  floatingActionButton: const FloatingActionButton(onPressed: null),
)
```

{@tool dartpad}
This example shows the [BottomAppBar], which can be configured to have a notch using the
[BottomAppBar.shape] property. This also includes an optional [FloatingActionButton], which illustrates
the [FloatingActionButtonLocation]s in relation to the [BottomAppBar].

** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.1.dart **
{@end-tool}

{@tool dartpad}
This example shows Material 3 [BottomAppBar] with its expected look and behaviors.

This also includes an optional [FloatingActionButton], which illustrates
the [FloatingActionButtonLocation.endContained].

** See code in examples/api/lib/material/bottom_app_bar/bottom_app_bar.2.dart **
{@end-tool}

See also:

 * [NotchedShape] which calculates the notch for a notched [BottomAppBar].
 * [FloatingActionButton] which the [BottomAppBar] makes a notch for.
 * [AppBar] for a toolbar that is shown at the top of the screen.
'''),
          ],
        ),
        stories: [widgets_bottom_app_bar.$Default],
      ),
      Component(
        meta: widgets_bottom_navigation_bar.meta.copyWith(
          documentation: [
            ...widgets_bottom_navigation_bar.meta.documentation,
            DocumentEntry(
                name: 'Docs',
                content:
                    '''A material widget that's displayed at the bottom of an app for selecting
among a small number of views, typically between three and five.

There is an updated version of this component, [NavigationBar], that's
preferred for new applications and applications that are configured
for Material 3 (see [ThemeData.useMaterial3]).

The bottom navigation bar consists of multiple items in the form of
text labels, icons, or both, laid out on top of a piece of material. It
provides quick navigation between the top-level views of an app. For larger
screens, side navigation may be a better fit.

A bottom navigation bar is usually used in conjunction with a [Scaffold],
where it is provided as the [Scaffold.bottomNavigationBar] argument.

The bottom navigation bar's [type] changes how its [items] are displayed.
If not specified, then it's automatically set to
[BottomNavigationBarType.fixed] when there are less than four items, and
[BottomNavigationBarType.shifting] otherwise.

The length of [items] must be at least two and each item's icon and
label must not be null.

 * [BottomNavigationBarType.fixed], the default when there are less than
   four [items]. The selected item is rendered with the
   [selectedItemColor] if it's non-null, otherwise the theme's
   [ColorScheme.primary] color is used for [Brightness.light] themes
   and [ColorScheme.secondary] for [Brightness.dark] themes.
   If [backgroundColor] is null, The
   navigation bar's background color defaults to the [Material] background
   color, [ThemeData.canvasColor] (essentially opaque white).
 * [BottomNavigationBarType.shifting], the default when there are four
   or more [items]. If [selectedItemColor] is null, all items are rendered
   in white. The navigation bar's background color is the same as the
   [BottomNavigationBarItem.backgroundColor] of the selected item. In this
   case it's assumed that each item will have a different background color
   and that background color will contrast well with white.

## Updating to [NavigationBar]

The [NavigationBar] widget's visuals
are a little bit different, see the Material 3 spec at
<https://m3.material.io/components/navigation-bar/overview> for
more details.

The [NavigationBar] widget's API is also slightly different.
To update from [BottomNavigationBar] to [NavigationBar], you will
need to make the following changes.

1. Instead of using [BottomNavigationBar.items], which
takes a list of [BottomNavigationBarItem]s, use
[NavigationBar.destinations], which takes a list of widgets.
Usually, you use a list of [NavigationDestination] widgets.
Just like [BottomNavigationBarItem]s, [NavigationDestination]s
have a label and icon field.

2. Instead of using [BottomNavigationBar.onTap],
use [NavigationBar.onDestinationSelected], which is also
a callback that is called when the user taps on a
navigation bar item.

3. Instead of using [BottomNavigationBar.currentIndex],
use [NavigationBar.selectedIndex], which is also an integer
that represents the index of the selected destination.

4. You may also need to make changes to the styling of the
[NavigationBar], see the properties in the [NavigationBar]
constructor for more details.

## Using [BottomNavigationBar]

{@tool dartpad}
This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
widgets, which means it defaults to [BottomNavigationBarType.fixed], and
the [currentIndex] is set to index 0. The selected item is
amber. The `_onItemTapped` function changes the selected item's index
and displays a corresponding message in the center of the [Scaffold].

** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.0.dart **
{@end-tool}

{@tool dartpad}
This example shows how you would migrate the above [BottomNavigationBar]
to the new [NavigationBar].

** See code in examples/api/lib/material/navigation_bar/navigation_bar.0.dart **
{@end-tool}

{@tool dartpad}
This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
widgets, which means it defaults to [BottomNavigationBarType.shifting], and
the [currentIndex] is set to index 0. The selected item is amber in color.
With each [BottomNavigationBarItem] widget, backgroundColor property is
also defined, which changes the background color of [BottomNavigationBar],
when that item is selected. The `_onItemTapped` function changes the
selected item's index and displays a corresponding message in the center of
the [Scaffold].

** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.1.dart **
{@end-tool}

{@tool dartpad}
This example shows [BottomNavigationBar] used in a [Scaffold] Widget with
different interaction patterns. Tapping twice on the first [BottomNavigationBarItem]
uses the [ScrollController] to animate the [ListView] to the top. The second
[BottomNavigationBarItem] shows a Modal Dialog.

** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.2.dart **
{@end-tool}
See also:

 * [BottomNavigationBarItem]
 * [Scaffold]
 * <https://material.io/design/components/bottom-navigation.html>
 * [NavigationBar], this widget's replacement in Material Design 3.
'''),
          ],
        ),
        stories: [widgets_bottom_navigation_bar.$Default],
      ),
      Component(
        meta: widgets_chips.meta.copyWith(
          documentation: [
            ...widgets_chips.meta.documentation,
            DocumentEntry(name: 'Docs', content: '''A Material Design chip.

Chips are compact elements that represent an attribute, text, entity, or
action.

Supplying a non-null [onDeleted] callback will cause the chip to include a
button for deleting the chip.

Its ancestors must include [Material], [MediaQuery], [Directionality], and
[MaterialLocalizations]. Typically all of these widgets are provided by
[MaterialApp] and [Scaffold]. The [label] and [clipBehavior] arguments must
not be null.


```dart
Chip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    child: const Text('AB'),
  ),
  label: const Text('Aaron Burr'),
)
```

See also:

 * [InputChip], a chip that represents a complex piece of information, such
   as an entity (person, place, or thing) or conversational text, in a
   compact form.
 * [ChoiceChip], allows a single selection from a set of options. Choice
   chips contain related descriptive text or categories.
 * [FilterChip], uses tags or descriptive words as a way to filter content.
 * [ActionChip], represents an action related to primary content.
 * [CircleAvatar], which shows images or initials of entities.
 * [Wrap], A widget that displays its children in multiple horizontal or
   vertical runs.
 * <https://material.io/design/components/chips.html>
'''),
          ],
        ),
        stories: [
          widgets_chips.$Chip,
          widgets_chips.$InputChip,
          widgets_chips.$ChoiceChip,
          widgets_chips.$FilterChip,
          widgets_chips.$ActionChip
        ],
      ),
    ];
