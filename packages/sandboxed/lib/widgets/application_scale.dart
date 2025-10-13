import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/settings.dart';

class ApplicationScale extends ConsumerWidget {
  final Widget child;

  const ApplicationScale({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);
    final scale = ref.watch(
          settingStorageProvider.select((value) => value.interfaceScale),
        ) ??
        1.0;

    return LayoutBuilder(
      builder: (context, constraints) => FittedBox(
        child: SizedBox(
          width: constraints.maxWidth * mq.devicePixelRatio / scale,
          height: constraints.maxHeight * mq.devicePixelRatio / scale,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              viewInsets: mq.viewInsets * mq.devicePixelRatio / scale,
              viewPadding: mq.viewPadding * mq.devicePixelRatio / scale,
              padding: mq.padding * mq.devicePixelRatio / scale,
              devicePixelRatio: scale,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
