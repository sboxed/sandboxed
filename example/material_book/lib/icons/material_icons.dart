import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';

enum IconToken { basic, sharp, rounded, outlined }

class IconInfo {
  final String name;
  final int code;
  final String? fontFamily;

  IconInfo({required this.name, required this.code, required this.fontFamily});
}

class MaterialIcons extends StatefulWidget {
  final double size;

  const MaterialIcons({super.key, this.size = 24});

  @override
  State<MaterialIcons> createState() => _MaterialIconsState();
}

class _MaterialIconsState extends State<MaterialIcons> {
  final searchController = TextEditingController();

  final source =
      'https://raw.githubusercontent.com/flutter/flutter/238db3574bbacae308950375f65ecffb7d15a734/packages/flutter/lib/src/material/icons.dart';

  late final response = Dio().get(source);

  List<IconInfo>? icons;
  Fuzzy<IconInfo>? fuzzy;

  Set<IconToken> tokens = IconToken.values.toSet();

  @override
  void initState() {
    response.then((value) {
      if (mounted) {
        final regex = RegExp(
          r"const IconData (\w+) = IconData\(([\dxa-f]+), fontFamily: '(\w+)'",
        );

        final matches = regex.allMatches(value.data!.toString()).toList();

        final icons = [
          for (final match in matches)
            IconInfo(
              name: match.group(1) ?? '<unknown>',
              code: int.parse(match.group(2)!),
              fontFamily: match.group(3),
            ),
        ];

        setState(() {
          this.icons = icons;
          fuzzy = Fuzzy(
            icons,
            options: FuzzyOptions(
              keys: [
                WeightedKey(name: 'name', getter: (obj) => obj.name, weight: 1),
              ],
            ),
          );
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final icons = this.icons;

        if (icons != null) {
          final cellWidth = widget.size * 4 + 16 * 2;
          final rowLength = (constraints.maxWidth / cellWidth).floor();

          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField(controller: searchController)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      onSelected: (value) {
                        setState(() {
                          if (tokens.contains(value)) {
                            if (tokens.length == 1) return;

                            tokens.remove(value);
                          } else {
                            tokens.add(value);
                          }
                        });
                      },
                      itemBuilder: (context) {
                        return [
                          for (final token in IconToken.values)
                            CheckedPopupMenuItem(
                              value: token,
                              enabled:
                                  tokens.length != 1 || //
                                  !tokens.contains(token),
                              checked: tokens.contains(token),
                              child: Text(token.name),
                            ),
                        ];
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListenableBuilder(
                  listenable: searchController,
                  builder: (context, child) {
                    var results = searchController.text.isNotEmpty
                        ? fuzzy!.search(searchController.text).map((e) => e.item).toList()
                        : icons;

                    results = results.where((icon) {
                      for (final token in IconToken.values) {
                        if (token == IconToken.basic) {
                          if (!IconToken.values.any(
                            (element) => icon.name.contains('_${element.name}'),
                          )) {
                            if (!tokens.contains(token)) {
                              return false;
                            }
                          }
                        }

                        if (icon.name.contains('_${token.name}')) {
                          if (!tokens.contains(token)) {
                            return false;
                          }
                        }
                      }

                      return true;
                    }).toList();

                    final rowCount = (results.length / rowLength).ceil();

                    return ListView.builder(
                      itemCount: rowCount,
                      itemBuilder: (context, index) {
                        final group = results.sublist(
                          index * rowLength,
                          (index * rowLength + rowLength).clamp(
                            0,
                            results.length,
                          ),
                        );

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final icon in group)
                              Builder(
                                builder: (context) {
                                  return Tooltip(
                                    message: icon.name,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: widget.size * 4,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              IconData(
                                                icon.code,
                                                fontFamily: icon.fontFamily,
                                              ),
                                              size: widget.size,
                                            ),
                                            Text(
                                              icon.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
