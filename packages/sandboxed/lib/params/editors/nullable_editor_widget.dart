import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

class NullableEditorWidget<T> extends StatelessWidget {
  final ParamValue<T> value;
  final Widget child;

  const NullableEditorWidget({
    super.key,
    required this.value,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (value.required || value.value != null) //
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: child,
            ),
          )
        else ...[
          if ((value.initial ?? value.default$) != null)
            ActionChip(
              label: Text("Set value"),
              onPressed: () => value.update(value.initial ?? value.default$),
            )
          else
            Text("-"),
          Spacer(),
        ],
        Builder(builder: (context) {
          final condition = !value.required && value.value != null;

          return IgnorePointer(
            ignoring: !condition,
            child: AnimatedOpacity(
              opacity: condition ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 160),
              child: IconButton(
                onPressed: () => value.update(null),
                icon: Icon(Icons.clear_rounded),
              ),
            ),
          );
        }),
        Builder(builder: (context) {
          final condition = value.changed;

          return IgnorePointer(
            ignoring: !condition,
            child: AnimatedOpacity(
              opacity: condition ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 160),
              child: IconButton(
                onPressed: () => value.update(value.initial),
                icon: Icon(Icons.replay_rounded),
              ),
            ),
          );
        }),
      ],
    );
  }
}
