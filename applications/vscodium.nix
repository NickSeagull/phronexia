{ config, pkgs, ... }:

{
  imports = [
    ./vscodium/keybindings/vspacecode.nix
    ./vscodium/settings/vspacecode.nix
  ];
  
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      # First things first
      vscodevim.vim
      
      # Keybindings suite Spacemacs style
      vspacecode.whichkey
      vspacecode.vspacecode

      # Git manager, much better than the default one, as
      # it can be controlled via keyboard
      kahole.magit
    ];
  };
}
