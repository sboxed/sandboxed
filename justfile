[group("packages")]
mod sandboxed "packages/sandboxed/mod.just"

[group("apps")]
mod sandbox-app "apps/sandbox/mod.just"

[group("apps")]
mod sandboxed-library "apps/sandboxed_library/mod.just"

[group("apps")]
mod material-book "example/material_book/mod.just"

[group("apps")]
mod monorepo "example/monorepo/mod.just"


[default]
_list:
    just --choose

generate: sandboxed::generate sandbox-app::generate sandboxed-library::generate material-book::generate monorepo::generate
    @echo "Generating code for sandboxed"