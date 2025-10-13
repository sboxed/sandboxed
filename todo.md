
(A) Url serialize/deserialize #editor {cm:2025-03-22}
(A) Write components generator #core {cm:2025-03-22}
(A) Write MDX document generator #core {c}
  Find `{component}.mdx` file, append to components documentation. {cm:2025-03-05}
  Add ability to define links to mdx files in component meta
  Render mdx content {cm:2025-03-05}
  Inject interactable stories
  Support link navigation betwen components, stories and doc entries.
  Parse tokens in [] brackets and search for existsing registerd components, if found make it deeplink
(A) Add `GeneratedStory` and `GeneratedMeta` wrappers #refactoring
(A) #Generator - Provide name of component to meta with `applyGenerated`
(A) Runtime params linting to find misnamed parameters.
  Description: In example you have story with params and then renamed params in component, sandboxed should highlight that no matched params found
  Add warnings panel with all misnamed parameters with links to code to fix it or autofix button.
(B) Lower count of dependencies
(B) Running golden tests from sandboxed #tests {c}
  (B) Local test runner
  (F) Cloud test runner
(B) Checking golden test results from sandboxed #tests
(B) Toggleable params #editor {cm:2025-03-22}
(B) Toggleable addons Small touchable dot near addon title. Yellow - `off`, Green - `on` #editor
(B) Component and story tags #search {cm:2025-03-09}
(B) `Param` interface and extensibility should be refined #core {cm:2025-10-13}
(B) Params - Support JSON serializable objects via generator
(B) Params {c}
  (A) Boolean Param {cm:2025-03-05}
  (A) Chips Param {cm:2025-03-05}
  (B) Multiple Chips Param {cm:2025-03-22}
  (A) Color Param {cm:2025-03-05}
  (A) String Param {cm:2025-03-05}
  (C) Action Trigger Param
  (B) Flutter params
    Alignment {cm:2025-04-01}
    EdgeInsets {cm:2025-10-13}
    TextStyle - partially
  (B) Select Field Param {cm:2025-10-13}
  (B) Multiple Select Field Param {cm:2025-10-13}
  (B) Multiline Text Param {cm:2025-10-13}
  (C) Code Param - param to edit code snippets in textarea #addon
  (A) Integer Param {cm:2025-03-05}
  (A) Integer Slider Param {cm:2025-10-13}
  (A) Double Param {cm:2025-03-05}
  (A) Double Slider Param {cm:2025-10-13}
  (B) Date Param {cm:2025-10-13}
  (B) Duration Param {cm:2025-10-13}
  (B) JSON serializable objects {cm:2025-10-13}
(B) Addons {c}
  (A) Alignment {cm:2025-03-05}
  (A) Pan and Zoom {cm:2025-03-05}
  (A) Reload {cm:2025-03-05}
  (A) Safe Area {cm:2025-03-05}
  (A) Param Builders {cm:2025-03-05}
  (A) Device Preview {cm:2025-03-22}
  (A) Locale
  (A) Theme Mode {cm:2025-03-22}
  (C) Time Dilation {cm:2025-10-13}
  (C) Text Scale
  (C) Accessibility
  (D) Panel Addons. Addons that can inject extra widgets to panels
  Lockable addons - lock addons by other addons
(C) Url persistence between sessions #editor {cm:2025-03-22}
(C) Settings tab/sheet in sidebar and bottom app bar #editor {cm:2025-10-13}
(F) Component auto-documentation #editor
(F) Allow passing pre-defined filters for search bar #editor
(F) Plugin to preview widgets in VS Code #ide
