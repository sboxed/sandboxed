[working-directory: 'ui_book']
generate:
    @echo "Generating code for monorepo"
    fvm dart run build_runner build -d