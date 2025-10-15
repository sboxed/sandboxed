import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<BottomAppBar>(
  name: 'Bottom App Bar', // optional
  module: 'Navigation',
  decorators: [
    Decorator(
      (context, story) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 390,
          height: 790,
          child: ClipRect(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surfaceBright,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
              bottomNavigationBar: story,
            ),
          ),
        ),
      ),
    ),
  ],
);

Story get $Default => Story(
  params: {
    'child': Row(
      children: <Widget>[
        IconButton(
          tooltip: 'Open navigation menu',
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'Search',
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'Favorite',
          icon: const Icon(Icons.favorite),
          onPressed: () {},
        ),
      ],
    ),
  },
  // builder: (context, params) {
  //   return BottomAppBar(
  //     child: Row(
  //       children: <Widget>[
  //         IconButton(
  //           tooltip: 'Open navigation menu',
  //           icon: const Icon(Icons.menu),
  //           onPressed: () {},
  //         ),
  //         IconButton(
  //             tooltip: 'Search',
  //             icon: const Icon(Icons.search),
  //             onPressed: () {}),
  //         IconButton(
  //             tooltip: 'Favorite',
  //             icon: const Icon(Icons.favorite),
  //             onPressed: () {}),
  //       ],
  //     ),
  //   );
  // },
);
