# Tags System

Tags are used in **Sandboxed** to categorize and filter components and stories in the UI.
They can be defined at the `Config`, `Meta` or `Story` level and support **negation** via the `!` prefix.

Tags are declared as simple strings:

```dart
Meta(
  name: 'Button',
  tags: ['input', '!internal'],
);

Story(
  name: 'Primary',
  tags: ['primary'],
);
```

## Negated Tags (`!` prefix)

The `!` prefix **negates** a tag within the current scope (`Meta` or `Story`):

- If a **global tag** is active (e.g. `'internal'`), applying `!internal` in a `Meta` or `Story` will **exclude** it from tag filtering.
- This allows you to opt-out individual components or stories from a broader filter.

### Example

```dart
// globally enabled tag
Config(
  tags: ['internal']
);

// component-level opt-out
Meta(
  name: 'DebugWidget',
  tags: ['!internal'], // this component will NOT be matched by 'internal' tag filters
);

// story-level opt-out
Story(
  name: 'DebugWidget',
  tags: ['!internal'], // this story will NOT be matched by 'internal' tag filters
);
```

## Tag Propagation

Tags are collected from:

- `Config.tags` *(WIP)*
- `Meta.tags`
- `Story.tags`

Global tags apply to **all components and stories**, unless explicitly negated with `!tag`.

The system strips the `!` prefix when building the complete tag list, so it won’t appear in the filter UI.
