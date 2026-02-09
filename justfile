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


[doc(
    """
    Bootstrap the system with 
    the necessary dependencies 
    for the project
    """
)]
bootstrap:
    #!/usr/bin/env bash
    set -e

    if [ "{{ os() }}" = "linux" ]; then
      echo "The following packages will be installed (sudo apt-get install):"
      echo "  clang           - C/C++ compiler"
      echo "  cmake           - Build system"
      echo "  ninja-build     - Build tool"
      echo "  pkg-config      - Library configuration"
      echo "  libgtk-3-dev    - GTK 3 for Linux desktop UI"
      echo "  libstdc++-12-dev - C++ standard library (dev)"
      echo "  lld-20          - LLVM linker (required for native build)"
      echo ""

      read -p "Continue? [y/N] " -n 1 -r
      echo

      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Bootstrap cancelled."
        exit 1
      fi

      echo "Installing Linux dependencies for Flutter (sandbox app)..."

      sudo apt-get update
      sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev libstdc++-12-dev lld-20

    else
      echo "Bootstrap (Linux deps) skipped on {{ os() }}."
    
    fi

generate: sandboxed::generate sandbox-app::generate sandboxed-library::generate material-book::generate monorepo::generate
    @echo "Generating code for sandboxed"

release:
    fvm dart run melos version
    git push --follow-tags