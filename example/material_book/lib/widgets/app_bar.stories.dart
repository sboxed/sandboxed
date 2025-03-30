import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';

Meta get meta => Meta<AppBar>(
      name: 'App Bar',
      decorators: [
        Decorator(
          (context, story) => Padding(
            padding: EdgeInsets.all(32),
            child: story,
          ),
        ),
        Decorator(
          (context, story) => Padding(
            padding: EdgeInsets.all(32),
            child: story,
          ),
        ),
        Annotate(
          text: 'Scaffold with Material App Bar',
          subtitle:
              'Shows how the app bar seamlessly integrates into scaffold for responsive layouts',
        ),
      ],
    );

Story get $Default => Story(
      name: "In Scaffold",
      decorators: [
        Decorator(
          (context, story) {
            return Scaffold(
              appBar: story as PreferredSizeWidget,
              body: Card(
                child: Center(
                  child: Text("Content"),
                ),
              ),
            );
          },
        )
      ],
      builder: (context, params) => AppBar(
        title: Text(params.string('title').required('Title')),
        actions: [
          if (params.string('action').optional("Action") case String action
              when action.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {}, child: Text(action)),
            ),
        ],
      ),
    );
