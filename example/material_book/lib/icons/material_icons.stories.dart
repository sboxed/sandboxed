import 'package:material_book/icons/material_icons.dart';
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<MaterialIcons>(name: 'Material Icons');

Story get $Default => Story(
      builder: (context, params) => MaterialIcons(
        size: params.number('size').required(24),
      ),
    );
