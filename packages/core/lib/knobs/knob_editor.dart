import 'package:flutter/widgets.dart';
import 'package:vibook_core/knobs/knobs_notifier.dart';

class KnobEditor extends StatelessWidget {
  final KnobsNotifier knobs;

  const KnobEditor({
    super.key,
    required this.knobs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final knob in knobs.items.entries)
          KnobTile(
            id: knob.key,
            knob: knob.value,
          ),
      ],
    );
  }
}

class KnobTile extends StatelessWidget {
  final String id;
  final Knob knob;

  const KnobTile({
    super.key,
    required this.id,
    required this.knob,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(id),
        Text(knob.value.toString()),
      ],
    );
  }
}
