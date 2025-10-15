import 'package:flutter/material.dart';

class FlutterParamsWidget extends StatelessWidget {
  final Alignment alignment;
  final EdgeInsets padding;
  final TextStyle style;

  const FlutterParamsWidget({
    super.key,
    required this.alignment,
    required this.padding,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: SizedBox(
              width: 256,
              height: 64,
              child: Align(
                alignment: alignment,
                child: SizedBox(
                  height: 24,
                  child: Card(
                    color: Colors.green,
                    child: Text(alignment.toString()),
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: padding,
              child: Center(child: Text("Padding - $padding")),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Custom Text Style', style: style)),
            ),
          ),
        ],
      ),
    );
  }
}
