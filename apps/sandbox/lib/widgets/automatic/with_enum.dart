import 'package:material_ui/material_ui.dart';
import 'package:sandboxed_sandbox/data/some_enum.dart';

class WithEnum extends StatelessWidget {
  final SomeEnum enumValue;

  const WithEnum({super.key, required this.enumValue});

  @override
  Widget build(BuildContext context) {
    return Text(enumValue.toString());
  }
}
