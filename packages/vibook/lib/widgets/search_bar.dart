import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/tags.dart';
import 'package:vibook/widgets/gap.dart';

class ViSearchBar extends ConsumerStatefulWidget {
  const ViSearchBar({super.key});

  @override
  ConsumerState<ViSearchBar> createState() => _ViSearchBarState();
}

class _ViSearchBarState extends ConsumerState<ViSearchBar> {
  final focus = FocusNode();
  final controller = TextEditingController();
  final tagMenuController = MenuController();

  @override
  void initState() {
    focus.addListener(() {
      if (!focus.hasPrimaryFocus) {
        controller.text = ref.read(searchQueryProvider);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      searchQueryProvider,
      (previous, next) => focus.hasPrimaryFocus ? null : controller.text = next,
    );

    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: focus,
            controller: controller,
            decoration: const InputDecoration(label: Text('Search')),
            onChanged: (value) {
              ref.read(searchQueryProvider.notifier).update(value);
            },
          ),
        ),
        if (ref.watch(allTagsProvider).isNotEmpty) ...[
          const Gap(12),
          MenuAnchor(
            controller: tagMenuController,
            menuChildren: [
              for (final tag in ref.watch(allTagsProvider))
                MenuItemButton(
                  onPressed: () =>
                      ref.read(tagFilterProvider.notifier).toggle(tag),
                  closeOnActivate: false,
                  child: Row(
                    children: [
                      Text(tag),
                      const Spacer(),
                      Checkbox(
                        value: ref.watch(tagFilterProvider).contains(tag),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
            ],
            child: IconButton(
              onPressed: () => tagMenuController.open(),
              icon: const Icon(Icons.tag),
            ),
          ),
        ],
      ],
    );
  }
}
