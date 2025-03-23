# Component and Story Format Specification

One dart module is corresponds to one component.

```dart
Meta get meta => Meta<MyComponent>(
  name: 'My Component',
  module: 'Features / Core',
  component: MyComponent,
  decorators: [
    Decorator((context, story) => Padding(
      padding: const EdgeInsets.all(16),
      child: story,
    )),
  ],
);

Story get $Green => Story(
  name: 'Green',
  builder: (context, params) {
    return MyComponent(
      onPressed: () {},
      title: params.string('title').required("Lorem"),
      color: params.color('color').required(Colors.green),
      size: params.single('size', SandboxButtonSize.values)
                .required(SandboxButtonSize.small),
    );
  },
);
```

## `Meta<T>`

Defines metadata for a widget used in **Sandboxed**.  
Used to register a component, organize it into modules, attach decorators, and provide static configuration.

### Properties

| Name           | Type                               | Description                                                                 |
|----------------|------------------------------------|-----------------------------------------------------------------------------|
| `name`         | `String?`                          | Optional name for the component. Defaults to the type name if not provided. |
| `component`    | `Type?`                            | Explicit widget type, inferred from `T` if not set.                         |
| `module`       | `String?`                          | Organizes the component in the sidebar/module hierarchy.                    |
| `documentation`| `List<DocumentEntry>`              | Additional documentation entries (e.g., MDX files).                         |
| `parameters`   | `Map<String, dynamic>`             | Static configuration options (e.g., `"golden": true`).                     |
| `decorators`   | `List<Decorator>`                  | Wrappers applied around all stories in this meta.                          |
| `tags`         | `List<String>`                     | Optional tags for filtering/searching components.                          |

---

### Behavior

- If `name` is not provided:
  - It will default to the type name (`T`) in title case.
  - On **Web**, if the name is missing, a warning will be logged and the name may be unobtainable due to Flutter optimizations.
- Use `parameters` for static config like layout or golden test flags.
- Use `decorators` to apply consistent padding or styling across all stories in this meta.

### Example

```dart
Meta get meta => Meta<MyButton>(
  name: 'My Button',
  module: 'UI / Buttons',
  parameters: {
    'golden': true,
  },
  decorators: [
    Decorator(
      (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    ),
  ],
);
```

## `Story`

Defines a single interactive example (story) of a widget inside **Sandboxed**.  
Each story is rendered in isolation with its own parameters, decorators, and tags.

---

### Parameters

| Name         | Type                    | Description                                                                 |
|--------------|-------------------------|-----------------------------------------------------------------------------|
| `name`       | `String?`               | Optional story name. If omitted, falls back to variable name      |
| `builder`    | `StoryBuilder`          | The widget builder function for the story.                                 |
| `decorators` | `List<Decorator>`       | List of wrappers around the story (e.g. padding, themes).                  |
| `params`     | `Map<String, dynamic>`  | Pre-defined param values applied before rendering.                         |
| `tags`       | `List<String>`          | Optional tags for filtering or searching stories.                          |
| `order`      | `int`                   | Optional number to control display order within the component.             |

---

### Story Builder

The `builder` receives context and params and must return a widget:

```dart
Story(
  name: 'Primary',
  builder: (context, params) {
    return MyButton(
      label: params.string('label').required('Click Me'),
      color: params.color('color').required(Colors.blue),
    );
  },
);
```

---

### Example

```dart
Story get $Green => Story(
  order: 1,
  name: 'Green',
  builder: (context, params) => MyWidget(
    title: params.string('title').required("Hello"),
    color: params.color('color').required(Colors.green),
  ),
  params: {
    'title': 'Default Title',
    'color': Colors.green,
  },
  decorators: [
    Decorator((context, child) => Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    )),
  ],
  tags: ['deprecated', 'atom'],
);
```

---

### Automatic Builder

If no `builder` is provided, `AutomaticBuilder` is used.  
This placeholder is replaced during generation with a real implementation using default constructor.
