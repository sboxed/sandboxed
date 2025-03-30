# <img src="https://raw.githubusercontent.com/sboxed/sandboxed-assets/main/logos/logo-64.png" alt="logo" /> Sandboxed

[![pub package](https://img.shields.io/pub/v/sandboxed.svg)](https://pub.dev/packages/sandboxed)
[![pub points](https://img.shields.io/pub/points/sandboxed)](https://pub.dev/packages/sandboxed/score)
[![likes](https://img.shields.io/pub/likes/sandboxed)](https://pub.dev/packages/sandboxed/score)
<!-- [![popularity](https://img.shields.io/pub/popularity/sandboxed)](https://pub.dev/packages/sandboxed/score) -->

**Sandboxed** is a Flutter tool for developing, testing, and showcasing  
UI components in isolation.  
 
- 🛠️ Design. ⚡ Build. 🔁 Preview.  
- ✨ Speed up development. 🧼 Improve maintainability. 📤 Share confidently.

---

## 🚀 Features

- 📦 Isolate widgets for independent development and testing  
- 🎨 Live preview with hot reload support  
- 🧪 Interactive params: bool, color, sliders, etc.
- 🧩 Built-in addons: pan, theme, safe area, viewport, reload
- 🏷️ Tags & searchable component catalog
- 🔗 Deep linking between stories and docs
- 📄 MDX docs with live stories *(WIP)*
- 🧹 Linting for invalid/missing params *(WIP)*
- 📸 Golden test integration *(WIP)*

---

## 📦 Packages

- [`sandboxed`](packages/sandboxed/README.md) — Main runtime & viewer UI  
- [`sandboxed_core`](packages/sandboxed_core/README.md) — Core primitives: `Meta`, `Story`, `Params`, etc.  
- [`sandboxed_generator`](packages/sandboxed_generator/README.md) — Code generation for story/component registry  
- [`sandboxed_ui_kit`](packages/sandboxed_ui_kit/README.md) — UI components used in the viewer (sidebar, layout, etc.)

## 📦 Installation

1. **Add it in your `pubspec.yaml`**:

    ```yaml
    dependencies:
      sandboxed_core:
      sandboxed:

    dev_dependencies:
      sandboxed_generator:
    ```
2. **Install dependencies**:
    ```bash
    flutter pub get
    ```
3. **Write Meta and stories**
4. **Run build_runner** (required only when adding, renaming, removing `Meta` or `Story`):
    ```bash
    flutter pub run build_runner build
    ```

---

## 🧰 Usage


To create and preview a widget in sandboxed, define a `Meta` and one or more `Story` objects:

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

Then define stories with configurable parameters:

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

Use `params.boolean`, `params.color`, `params.string`, `params.single`, or `params.multi` to make your widget interactive in the UI.  
Stories will be listed in the visual explorer and updated live via hot reload.

> [!WARNING]
> **Important**
> 
> Run `flutter pub run build_runner build` after adding, renaming, removing `Meta` or `Story` getters to update the component registry.
>
> ♻️ **Hot reload friendly:** All other changes (e.g. story content, styling, params) are picked up automatically with hot reload.

### 💡 VS Code Snippets

You can add these snippets to your VS Code to speed up writing stories and meta definitions.

<details>
<summary>Expand</summary>

#### How to add:

1. Open Command Palette → `Preferences: Configure User Snippets`
2. Create or open a global or workspace snippet file
3. Paste the following:

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

## 📁 Project Structure

```
apps/
├── sandbox/                  # App for testing sandboxed components in isolation
├── sandboxed_library/        # App for testing Sandboxed UI Kit

packages/
├── sandboxed/                # Main UI and logic for the sandbox viewer
├── sandboxed_core/           # Low-level primitives for stories, components, params
├── sandboxed_generator/      # Code generation tools for component discovery
├── sandboxed_ui_kit/         # UI kit used internally by sandboxed apps

example/
├── material_book/            # Demo showcasing Material widgets
├── monorepo/                 # Example of integrating Sandboxed into a monorepo

docs/                         # Developer documentation and guides
.vscode/                      # VSCode workspace configuration
melos.yaml                    # Melos workspace config for multi-package setup
pubspec.yaml                  # Root pubspec for tool-level dependencies
```

---

## 📅 Roadmap

- 🌐 URL state & session persistence (Done)
- 🛠 Generated docs from source/meta (Partial)
- 🧠 Param mismatch detection + fixes
- 🧪 Golden test runner (local & cloud)
- 🧰 Extended param types (select, JSON, code)
- 🛎 Settings panel in UI
- 🧭 Pre-filled search filters
- 🧩 Lockable & toggleable addons
- 🧠 VS Code preview plugin (Maybe)
- ♻️ Reduce dependency footprint

---

## 🧑‍💻 Contributing

Contributions are welcome!  
Feel free to open issues, submit PRs, or suggest features.

---

## 📄 License

MIT License © 2025 [Sandboxed](https://github.com/sboxed), [Vadim Melnikov](https://github.com/rIIh)