# 🧩 Sandboxed Core

Core primitives for [**Sandboxed**](https://github.com/your-username/sandboxed) —  
a Flutter tool for developing, testing, and documenting UI components in isolation.

This package contains the core types used to define and organize components and stories, including:

- `Meta` — component metadata
- `Story` — interactive use-case definitions
- `Params` — runtime param interfaces
- `DocumentEntry` — documentation support (e.g. MDX)
- `Decorator` — widget wrappers for layout and context
- `Config` — global configuration for storybooks

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  sandboxed_core:
```

---

## 🧱 Example

```dart
import 'package:sandboxed_core/sandboxed_core.dart';

Meta get meta => Meta<MyButton>(
  name: 'My Button',
  module: 'UI / Buttons',
  parameters: {
    'golden': true,
  },
  decorators: [
    Decorator((context, child) => Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    )),
  ],
);

Story get $Primary => Story(
  name: 'Primary',
  builder: (context, params) => MyButton(
    title: params.string('title').required('Click Me'),
    color: params.color('color').required(Colors.blue),
  ),
);
```

---

## 📄 License

MIT License © 2025 [Sandboxed](https://github.com/sboxed), [Vadim Melnikov](https://github.com/rIIh)
