{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # AI based assistant for code completion
    github.copilot

    # AI based examples and suggestions by Macrohard
    visualstudioexptteam.vscodeintellicode
    visualstudioexptteam.intellicode-api-usage-examples

    # VS Code for doing stuff with the voice
    ms-vscode.vscode-speech

    # Show errors and warnings inline
    usernamehw.errorlens

    # Autocomplete for paths
    christian-kohler.path-intellisense

    # EditorConfig support
    editorconfig.editorconfig

    # Show tests in the sidebar
    hbenl.vscode-test-explorer

    # Allow separating monorepos into multiple workspaces
    folke.vscode-monorepo-workspace

    # Spell checker for source code
    streetsidesoftware.code-spell-checker

    # Take cool screenshots of the code
    adpyke.codesnap

    # Access your GitHub actions from within VS Code
    github.vscode-github-actions

    # Preview Regexes and test them directly in the editor
    chrmarti.regex

    # Visualize JSON data as a graph
    aykutsarac.jsoncrack-vscode

    # Search everywhere in the editor using fuzzy
    kbysiec.vscode-search-everywhere
  ];
}
