import 'package:flutter/material.dart';
import 'package:sandboxed_core/src/params/params.dart';

class UnsupportedParamWidget extends StatelessWidget {
  final UnsupportedParamException exception;

  const UnsupportedParamWidget({
    super.key,
    required this.exception,
  });

  String paramType(ParamWrapper param) {
    return RegExp('<(.+)>')
            .firstMatch(param.runtimeType.toString())
            ?.group(1) ??
        '<unknown type>';
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Center(
        child: Card(
          color: Colors.red,
          elevation: 4,
          shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconTheme(
              data: IconTheme.of(context).copyWith(
                color: Colors.white,
              ),
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Icon(Icons.error),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Story has unsupported parameters\n'
                      '- [${exception.param.id}] of type ${paramType(exception.param)}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
