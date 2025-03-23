# 🧪 sandboxed

**`sandboxed`** is the main runtime and viewer package for [**Sandboxed**](https://github.com/your-username/sandboxed) —  
a tool for building, testing, and documenting Flutter UI components in isolation.

This package powers the core experience: the live preview UI, interactive controls, addons, and component explorer.

---

## 📦 Installation

Add a local path dependency in your `pubspec.yaml`:

```yaml
dependencies:
  sandboxed:
    path: {PATH_TO_REPO}/packages/sandboxed
```

> Replace `{PATH_TO_REPO}` with the full path to the cloned repo on your machine.

You will also need:
- [`sandboxed_core`](../sandboxed_core)
- [`sandboxed_generator`](../sandboxed_generator) (for codegen)

---

## 🧰 What It Includes

- Viewer UI with sidebar navigation, search, and preview
- Runtime param editors and controls
- Built-in addons (safe area, theme switcher, device preview, etc.)
- Layout engine for stories and decorators
- Tag filtering, golden test support, and more

---

## ▶️ Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:sandboxed/sandboxed.dart';

void main() {
  runApp(
    Sandboxed(
      title: Text("Brand Name"),
      brandColor: Colors.green,
      components: components,
      addons: [
        InteractiveViewerAddon(constrained: false),
        SafeAreaAddon(),
        AlignmentAddon(),
      ],
    ),
  );
}
```

Register your components and stories using `Meta` and `Story`, then run the app to browse and test your widgets interactively.

---

## 🧩 Addons

This package includes several built-in addons:

- ✅ Safe Area
- ✅ Pan & Zoom
- ✅ Reload
- ✅ Param Builders
- ✅ Device Preview
- ✅ Theme Mode
- ✅ Tag Renderer

More addons can be added by extending the `Addon` interface and registering them via providers.

---

## ⚙️ Dev Notes

When you add, rename or remove a `Meta` or `Story` getters, make sure to rebuild the registry:

```bash
flutter pub run build_runner build
```

All other changes support hot reload out of the box.

---

## 📄 Related Packages

- [`sandboxed_core`](../sandboxed_core/README.md) — Primitives: Meta, Story, Params, Decorators
- [`sandboxed_generator`](../sandboxed_generator/README.md) — Builder that generates component registry
- [`sandboxed_ui_kit`](../sandboxed_ui_kit/README.md) — UI components used by the viewer

---

## 📄 License

MIT License © 2025 [Sandboxed](https://github.com/sboxed), [Vadim Melnikov](https://github.com/rIIh)
