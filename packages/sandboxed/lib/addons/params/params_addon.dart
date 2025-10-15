import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/panel_addon.dart';
import 'package:sandboxed/inspector/params_editor.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed_core/component.dart';
import 'package:sandboxed_core/story.dart';

final class ParamsAddon extends Addon with PanelAddon {
  @override
  String get id => 'params_addon';

  @override
  List<Panel> get panels {
    return [
      ParamsPanel(this),
    ];
  }
}

class ParamsPanel extends Panel<ParamsAddon> {
  const ParamsPanel(super.addon);

  @override
  String get id => "${addon.id}:params";

  @override
  Widget buildTitle(BuildContext context, Component component, Story story) {
    return Text("Params");
  }

  @override
  Widget buildBody(BuildContext context, Component component, Story story) {
    return Consumer(
      builder: (context, ref, child) {
        final hasParams = ref
            .watch(paramsProvider(ref.watch(paramsScopeIdProvider)))
            .items
            .isNotEmpty;

        if (hasParams) {
          return ParamsEditor();
        }

        return Center(
          child: MarkdownBody(
            // TODO(@melvspace): 10/16/25 add documentation link about params
            data: """
This story has no params

Learn how to interact with your stories with params
              """,
          ),
        );
      },
    );
  }
}
