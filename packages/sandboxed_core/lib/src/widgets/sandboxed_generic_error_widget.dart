import 'package:flutter/material.dart';

/// A widget that displays an error message
///
/// This widget is used to display a fatal error within a [Story].
/// It is typically used as a fallback when a story fails to build.
///
/// The [message] parameter is the error message to display.
class SandboxedGenericErrorWidget extends StatelessWidget {
  final String message;

  const SandboxedGenericErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: Colors.red,
            elevation: 4,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconTheme(
                data: IconTheme.of(context).copyWith(
                  color: Colors.white,
                ),
                child: DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: Icon(Icons.error),
                      ),
                      const SizedBox(width: 12),
                      Flexible(child: Text(message)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
