{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      # Keybindings suite Spacemacs style
      vspacecode.whichkey
      vspacecode.vspacecode
    ];
  };
}
