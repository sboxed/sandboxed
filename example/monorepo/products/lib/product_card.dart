import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Product', style: Theme.of(context).textTheme.headlineSmall),
          Text('Description', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
