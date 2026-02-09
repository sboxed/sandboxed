import 'package:flutter/material.dart';

class TextStyleShowcase extends StatelessWidget {
  final TextStyle style;

  const TextStyleShowcase({
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Quick Brown Fox',
                      style: style,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Jumps Over The Lazy Dog',
                      style: style,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0123456789',
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: style,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'consectetur adipiscing elit',
                      style: style,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'sed do eiusmod tempor incididunt',
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'This is a longer text to demonstrate how the TextStyle '
                    'properties affect paragraph rendering. You can adjust '
                    'font size, weight, style, color, letter spacing, word '
                    'spacing, line height, and decorations to see how they '
                    'transform the appearance of text.',
                    style: style,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
