import 'package:flutter/widgets.dart';

class ListenableListener extends StatefulWidget {
  final Listenable? listenable;
  final VoidCallback onChange;
  final Widget? child;

  const ListenableListener({
    super.key,
    required this.listenable,
    required this.onChange,
    this.child,
  });

  @override
  State<ListenableListener> createState() => _ListenableListenerState();
}

class _ListenableListenerState extends State<ListenableListener> {
  void handleChange() => widget.onChange();

  @override
  void initState() {
    widget.listenable?.addListener(handleChange);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ListenableListener oldWidget) {
    oldWidget.listenable?.removeListener(handleChange);
    widget.listenable?.addListener(handleChange);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.listenable?.removeListener(handleChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}
