import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.dart';
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile_icons.dart';

Meta get meta => const Meta<ElementTile>(name: 'Element Tile');

Story get $Default => Story(
      decorators: [
        Decorator(
          (context, story) => SizedBox(
            width: 390,
            child: story,
          ),
        ),
        Decorator(
          (context, story) => Card.filled(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: story,
          ),
        ),
      ],
      builder: (context, params) {
        return ElementTile(
          onPressed: params.boolean('enabled').required(true) ? () {} : null,
          depth: params.integer('depth').required(1).clamp(1, 10),
          selected: params.boolean('selected').required(false),
          size: params
              .single('size', ElementTileSize.values)
              .required(ElementTileSize.small),
          tooltip: params
              .string('tooltip')
              .required('Pretty tooltip with useful information'),
          icon: params
              .single('icon', ElementTileIcons.values)
              .optional(ElementTileIcons.component)
              ?.icon,
          title: Text(params.string('title').required('Element')),
        );
      },
    );

Story get $Tree => Story(
      decorators: [
        Decorator(
          (context, story) => ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 390),
            child: story,
          ),
        ),
        Decorator(
          (context, story) => Drawer(
            child: story,
          ),
        ),
        Decorator(
          (context, story) => Align(
            alignment: Alignment.topCenter,
            child: story,
          ),
        ),
        Decorator(
          (context, story) => SingleChildScrollView(
            child: story,
          ),
        )
      ],
      builder: (context, params) {
        final faker = Faker.withGenerator(RandomGenerator(seed: 0));

        final nodes = [
          (0 + 1, ElementTileSize.large, ElementTileIcons.module),
          (1 + 1, ElementTileSize.small, ElementTileIcons.module),
          (2 + 1, ElementTileSize.small, ElementTileIcons.component),
          (3 + 1, ElementTileSize.small, ElementTileIcons.story),
          (3 + 1, ElementTileSize.small, ElementTileIcons.story),
          (1 + 1, ElementTileSize.medium, ElementTileIcons.module),
          (2 + 1, ElementTileSize.small, ElementTileIcons.component),
          (3 + 1, ElementTileSize.small, ElementTileIcons.story),
          (3 + 1, ElementTileSize.small, ElementTileIcons.story),
          (0 + 1, ElementTileSize.large, ElementTileIcons.module),
          (1 + 1, ElementTileSize.small, ElementTileIcons.warning),
          (1 + 1, ElementTileSize.small, ElementTileIcons.component),
          (1 + 1, ElementTileSize.small, ElementTileIcons.component),
        ];

        return Column(
          children: [
            for (final (index, (depth, size, icon)) in nodes.indexed)
              ElementTile(
                onPressed: () {},
                depth: depth,
                selected: index == 3,
                size: size,
                tooltip: params
                    .string('tooltip')
                    .required('Pretty tooltip with useful information'),
                icon: icon.icon,
                title: Text(faker.lorem
                    .words(faker.randomGenerator.integer(3, min: 1))
                    .join(' ')),
              )
          ],
        );
      },
    );
