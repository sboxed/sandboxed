import 'package:flutter/material.dart';

class NavigatorBoundaryScenario extends StatelessWidget {
  const NavigatorBoundaryScenario({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 560,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'This scenario shows the wanted behavior of StoryViewport',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'StoryViewport should block any ancestors above it '
              'from being accessed in the story context',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Currently, this is impossible to implement due to unextendable '
              'Flutter internals for element tree traversal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                useRootNavigator: true,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "This dialog should be shown in viewport area",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
        ],
      ),
    );
  }
}
