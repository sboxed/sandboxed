import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

/// Wrap story in bordered box and add title above to explain.
class Annotate extends DecoratorInterface {
  final String text;
  final String? subtitle;
  final BoxBorder? border;

  const Annotate({
    required this.text,
    this.subtitle,
    this.border,
  });

  @override
  Widget decorate(BuildContext context, Widget story) {
    // TODO(@melvspace): 03/30/25 substitute story-meta params
    // TODO(@melvspace): 03/30/25 hide if *ViewportAddon* enabled
    // TODO(@melvspace): 03/30/25 hide if embedded?
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (subtitle case String subtitle)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        const SizedBox(height: 16.0),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: border ??
                  Border.all(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
            ),
            child: story,
          ),
        ),
      ],
    );
  }
}
