
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # Spell checker for source code
    streetsidesoftware.code-spell-checker
  ];

  programs.vscode.userSettings.cSpell.userWords = [
    "nixos"
  ];
}
