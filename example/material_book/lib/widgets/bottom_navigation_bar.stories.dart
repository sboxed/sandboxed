import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<BottomNavigationBar>(
      name: 'Bottom Navigation Bar', // optional
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
                  bottomNavigationBar: story,
                ),
              ),
            ),
          ),
        )
      ],
    );

Story get $Default => Story(
      name: 'Green',
      params: {
        'items': [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Catalog',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      },
    );
