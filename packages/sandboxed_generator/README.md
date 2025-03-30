# ⚙️ Sandboxed Generator

**`sandboxed_generator`** is the code generation package for [**Sandboxed**](https://github.com/sboxed/sandboxed),  
a Flutter tool for building, testing, and documenting UI components in isolation.

This package generates the component and story registry used by the `sandboxed` viewer.

---

## 📦 Installation

Add *sandboxed_generator* and `build_runner` to your `pubspec.yaml`:

```yaml
dev_dependencies:
  build_runner: any
  sandboxed_generator: 
```

> Replace `{PATH_TO_REPO}` with the path to your local clone.

---

## 🚀 What It Does

- Scans for all `Meta` and `Story` declarations
- Automatically generates a full component registry
- Supports `.mdx` documentation attachment
- Merges with optional manual config
- Fully hot-reload compatible after initial generation

> [!NOTE]
> The generator searches for `Meta` and `Story` in the **current package** and all **transitive dependencies**.  
> This allows modular story definitions across packages in a monorepo setup.

---

## Usage

1. Define your stories:

```dart
Meta get meta => Meta<MyWidget>(name: 'My Widget');

Story get $Primary => Story(
  builder: (context, params) => MyWidget(),
);
```

2. Run the generator:

```bash
flutter pub run build_runner build
```

3. The generated registry will be picked placed at `lib/components.g.dart` files. You can pass it to `Sandboxed`.

```dart
import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:{your_package}/components.g.dart';

void main() {
  runApp(
    Sandboxed(
      title: Text("Brand Name"),
      components: components,
    ),
  );
}

```

---

## 🛠 Configuration

You can optionally configure the generator with a `build.yaml` file to change:

- Output location *(WIP)*
- Entry point scanning behavior *(WIP)*
- Filtering rules *(WIP)*

---

## 🔗 Related Packages

- [`sandboxed`](../sandboxed/README.md) — Viewer App
- [`sandboxed_core`](../sandboxed_core/README.md) — Meta / Story primitives
- [`sandboxed_ui_kit`](../sandboxed_ui_kit/README.md) — Viewer UI components

---

## 📄 License

MIT License © 2025 [Sandboxed](https://github.com/sboxed), [Vadim Melnikov](https://github.com/rIIh)
