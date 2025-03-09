// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/src/ast.dart' as md;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vibook/widgets/scroll_controller_builder.dart';

class ViMarkdown extends StatelessWidget {
  final String data;
  final bool scrollable;

  const ViMarkdown(this.data, {super.key}) : scrollable = false;

  const ViMarkdown.scrollable(this.data, {super.key}) : scrollable = true;

  @override
  Widget build(BuildContext context) {
    final style = buildMarkdownStyleSheet(context);

    return SelectionArea(
      child: scrollable
          ? Markdown(
              data: data,
              softLineBreak: true,
              builders: {
                'pre': _CodeBuilder(styleSheet: style),
              },
              checkboxBuilder: (value) => buildCheckbox(
                value,
                style.p?.fontSize ?? 24,
              ),
              styleSheet: style,
              onTapLink: (text, href, title) =>
                  handleLinkTap(context, text, href, title),
            )
          : MarkdownBody(
              data: data,
              softLineBreak: true,
              builders: {
                'pre': _CodeBuilder(styleSheet: style),
              },
              checkboxBuilder: (value) => buildCheckbox(
                value,
                style.p?.fontSize ?? 24,
              ),
              styleSheet: style,
              onTapLink: (text, href, title) =>
                  handleLinkTap(context, text, href, title),
            ),
    );
  }

  Widget buildCheckbox(bool value, double size) {
    return IgnorePointer(
      child: SizedBox(
        height: size,
        child: Checkbox(
          value: value,
          onChanged: (value) {},
        ),
      ),
    );
  }

  Future<void> handleLinkTap(
    BuildContext context,
    String text,
    String? href,
    String title,
  ) async {
    if (href == null) return;
    if (await canLaunchUrlString(href)) {
      launchUrlString(href);
    } else {
      Clipboard.setData(ClipboardData(text: href));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Link copied into clipboard'),
          ),
        );
      }
    }
  }
}

MarkdownStyleSheet buildMarkdownStyleSheet(BuildContext context) {
  const double kQuoteBorderWidth = 5;
  const double kQuoteBorderPadding = 4;
  const double kQuotePadding = 8;

  return MarkdownStyleSheet(
    code: GoogleFonts.jetBrainsMono(),
    codeblockDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).colorScheme.surfaceContainer,
    ),
    blockquotePadding: const EdgeInsets.only(
      left: kQuotePadding + kQuoteBorderWidth + kQuoteBorderPadding,
      top: kQuotePadding,
      right: kQuotePadding,
      bottom: kQuotePadding,
    ),
    blockquoteDecoration: BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Theme.of(context).colorScheme.surfaceContainer,
          width: kQuoteBorderWidth,
        ),
      ),
      // color: Theme.of(context).colorScheme.surfaceContainer,
    ),
    h1Padding: const EdgeInsets.only(bottom: 8, top: 24),
    h2Padding: const EdgeInsets.only(bottom: 8, top: 20),
    h3Padding: const EdgeInsets.only(bottom: 8, top: 18),
    h4Padding: const EdgeInsets.only(bottom: 8, top: 14),
    h5Padding: const EdgeInsets.only(bottom: 8, top: 12),
    h6Padding: const EdgeInsets.only(bottom: 8, top: 10),
    listBulletPadding: const EdgeInsets.only(left: 8),
    blockSpacing: 4,
  );
}

class _CodeBuilder extends MarkdownElementBuilder {
  final MarkdownStyleSheet styleSheet;

  _CodeBuilder({required this.styleSheet});

  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    return ScrollControllerBuilder(
      builder: (context, controller) => Scrollbar(
        controller: controller,
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: styleSheet.codeblockPadding ?? const EdgeInsets.all(8),
            child: Text(
              text.text,
              style: preferredStyle,
              textScaler: styleSheet.textScaler,
            ),
          ),
        ),
      ),
    );
  }
}
