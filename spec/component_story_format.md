# Component and Story Format Specification

One dart module is corresponds to one component.

```dart
const meta = Meta<MyComponent>(
  name: 'Diagram Card', // optional
  component: MyComponent, // optional
  params: {
    "golden": true,
    "fullpage": true,
  }
);

get $Percentage => Story(
  builder: (context) {
    final args = context.params.title();

    return MyComponent(
      type: MyComponentType.percentage,
    );
  }
);

get $Integer => Story(
  builder: (context, args) {
    final title = context.params.string("Lorem");

    return MyComponent(
      title: title,
      type: MyComponentType.integer,
    );
  }
);
```

## Component parts
