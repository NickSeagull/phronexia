{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
        upgrade-system = "cd $HOME/phronexia && git pull --rebase && sudo nixos-rebuild switch";
    };
  };
}
