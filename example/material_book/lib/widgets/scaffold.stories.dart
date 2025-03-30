import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<Scaffold>(name: 'Scaffold', decorators: []);

Story get $Default => Story(
      builder: (context, params) => Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                  tooltip: 'Search',
                  icon: const Icon(Icons.search),
                  onPressed: () {}),
              IconButton(
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {}),
            ],
          ),
        ),
        floatingActionButtonLocation: params
            .single(
              'fab_position',
              _fabLocations,
            )
            .optional(null),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("FAB"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Text(
                  "Drawer Header",
                ),
              ),
            ],
          ),
        ),
        body: Card(
          child: Center(
            child: Text(params.string('content').required('Content')),
          ),
        ),
      ),
    );

final List<FloatingActionButtonLocation> _fabLocations = [
  FloatingActionButtonLocation.startTop,
  FloatingActionButtonLocation.miniStartTop,
  FloatingActionButtonLocation.centerTop,
  FloatingActionButtonLocation.miniCenterTop,
  FloatingActionButtonLocation.endTop,
  FloatingActionButtonLocation.miniEndTop,
  FloatingActionButtonLocation.startFloat,
  FloatingActionButtonLocation.miniStartFloat,
  FloatingActionButtonLocation.centerFloat,
  FloatingActionButtonLocation.miniCenterFloat,
  FloatingActionButtonLocation.endFloat,
  FloatingActionButtonLocation.miniEndFloat,
  FloatingActionButtonLocation.startDocked,
  FloatingActionButtonLocation.miniStartDocked,
  FloatingActionButtonLocation.centerDocked,
  FloatingActionButtonLocation.miniCenterDocked,
  FloatingActionButtonLocation.endDocked,
  FloatingActionButtonLocation.miniEndDocked,
  FloatingActionButtonLocation.endContained,
];
