{ config, pkgs, ... }:
/*
* This module is imported at system level, because it is the system shell,
*/
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      upgrade-system = "cd $HOME/phronexia && git pull --rebase && sudo nixos-rebuild switch";
    };
  };
}
