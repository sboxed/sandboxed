# Useful code snippets

To increase speed of creation new stories add these snippets to your project

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
      ");",
    ]
  },
}
```

## Create stories for new component

If you just created a new file for stories for your new component you should use `metastory` 
snippet to create `Meta` and `Story` exports.

## Add stories to existing ones

If you want to add an additional story to existing story exports use `story` snippet. 
It will add simple story export to your file.

## Package configuration

If you want to configure your package to use in monorepo sandboxed structure, 
you should create `lib/stories/config.dart` file and use `storyconfig` snippet there.

See API Reference to check what options you have.