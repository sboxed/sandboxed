# How to collapse subfiles in VSCode

It will collapse `.mdx` and `.stories.dart` under main file, or `.mdx` under `.stories.dart` if no main file exists.

```
  "explorer.fileNesting.patterns": {
    "*.dart": "${capture}.*.dart,${capture}.mdx",
    "*.stories.dart": "${capture}.mdx"
  }
```