{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # AI based assistant for code completion
    github.copilot

    # AI based examples and suggestions by Macrohard
    visualstudioexptteam.vscodeintellicode
    visualstudioexptteam.intellicode-api-usage-examples

    # Show errors and warnings inline
    usernamehw.errorlens

    # Autocomplete for paths
    christian-kohler.path-intellisense

    # EditorConfig support
    editorconfig.editorconfig

    # Show tests in the sidebar
    hbenl.vscode-test-explorer

    # Spell checker for source code
    streetsidesoftware.code-spell-checker

    # Take cool screenshots of the code
    adpyke.codesnap

    # Access your GitHub actions from within VS Code
    github.vscode-github-actions
  ];
}
