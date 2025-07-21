# <img src="https://raw.githubusercontent.com/sboxed/sandboxed-assets/main/logos/logo-512.png" height="64px" alt="logo" /> Sandboxed

[![pub package](https://img.shields.io/pub/v/sandboxed.svg)](https://pub.dev/packages/sandboxed)
[![pub points](https://img.shields.io/pub/points/sandboxed)](https://pub.dev/packages/sandboxed/score)
[![likes](https://img.shields.io/pub/likes/sandboxed)](https://pub.dev/packages/sandboxed/score)


**Sandboxed** is a Flutter tool for developing, testing, and previewing UI components in isolation.

---

## Features

* Isolated widget development and testing
* Live preview with hot reload
* Configurable interactive parameters (boolean, color, string, etc.)
* Built-in addons: pan, theme, safe area, viewport, reload
* Tagging and searchable component catalog
* Deep linking between stories and documentation
* MDX documentation with embedded stories *(WIP)*
* Param validation and linting *(WIP)*
* Golden test integration *(WIP)*

---

## Packages

* [`sandboxed`](packages/sandboxed/README.md) — Main viewer and runtime
* [`sandboxed_core`](packages/sandboxed_core/README.md) — Story primitives and params
* [`sandboxed_generator`](packages/sandboxed_generator/README.md) — Code generation tools
* [`sandboxed_ui_kit`](packages/sandboxed_ui_kit/README.md) — Internal UI components

---

## Installation

1. Add to `pubspec.yaml`:

   ```yaml
   dependencies:
     sandboxed_core:
     sandboxed:

   dev_dependencies:
     sandboxed_generator:
   ```

2. Fetch dependencies:

   ```bash
   flutter pub get
   ```

3. Write `Meta` and `Story` definitions

4. Run code generation:

   ```bash
   flutter pub run build_runner build
   ```

---

## Usage

Define a component and its metadata:

```dart
Meta get meta => Meta<SandboxButton>(
  name: 'Button',
  module: 'Features / Core',
  component: SandboxButton,
  decorators: [
    Decorator((context, story) => Padding(
      padding: const EdgeInsets.all(16),
      child: story,
    )),
  ],
);
```

Add stories with interactive parameters:

```dart
Story get $Green => Story(
  name: 'Green',
  builder: (context, params) {
    return SandboxButton(
      onPressed: () {},
      title: params.string('title').required("Lorem"),
      color: params.color('color').required(Colors.green),
      size: params.single('size', SandboxButtonSize.values)
                .required(SandboxButtonSize.small),
    );
  },
);
```

Use `params.boolean`, `params.color`, `params.string`, `params.single`, or `params.multi` to configure interactivity.

> [!WARNING]
> 
> Run `flutter pub run build_runner build` after adding, renaming, or removing `Meta` or `Story` definitions.
> 
> Other changes are applied automatically via hot reload.

---

## VS Code Snippets

To streamline writing stories, add the following to your VS Code user snippets.

<details>
<summary>Show snippet setup</summary>

#### How to add:

1. Open Command Palette → `Preferences: Configure User Snippets`
2. Create or open a global or workspace snippet file
3. Paste:

```json
{
  "Meta + Story": {
    "prefix": "metastory",
    "description": "Creates a new Sandboxed Story with default Meta",
    "body": [
      "import 'package:flutter/widgets.dart';",
      "import 'package:sandboxed_core/sandboxed_core.dart';",
      "",
      "Meta get meta => Meta<${1:Widget}>();",
      "",
      "Story get $${2:Default} => Story($0);"
    ]
  },
  "Story": {
    "prefix": "story",
    "description": "Creates a new Sandboxed Story",
    "body": [
      "Story get $${2:Default} => Story($0);"
    ]
  },
  "Story Config": {
    "prefix": "storyconfig",
    "description": "Creates a global story config",
    "body": [
      "import 'package:sandboxed_core/sandboxed_core.dart';",
      "",
      "Config get config => Config(",
      "  module: '',",
      ");"
    ]
  }
}
```

</details>

---

## Project Structure

```
apps/
├── sandbox/                  # Testing app for sandboxed stories
├── sandboxed_library/        # Viewer for UI Kit components

packages/
├── sandboxed/                # Main viewer implementation
├── sandboxed_core/           # Core abstractions
├── sandboxed_generator/      # Code generation
├── sandboxed_ui_kit/         # UI library for viewer interface

example/
├── material_book/            # Sample stories for Material components
├── monorepo/                 # Monorepo integration example

docs/                         # Documentation and guides
.vscode/                      # VS Code workspace settings
melos.yaml                    # Melos workspace config
pubspec.yaml                  # Root dependencies
```

---

## Roadmap

* Session persistence and URL state (done)
* Source-based doc generation (partial)
* Param validation and mismatch detection
* Golden test support (local/cloud)
* Advanced param types (select, JSON, code)
* Customizable settings panel
* Search filtering
* Lockable addons
* VS Code integration (research)
* Reduced dependency footprint (research)

---

## Contributing

Contributions are welcome.
Please open an issue or submit a pull request to get involved.

---

## License

MIT License © 2025 [Sandboxed](https://github.com/sboxed)
Developed by [Vadim Melnikov](https://github.com/rIIh)
