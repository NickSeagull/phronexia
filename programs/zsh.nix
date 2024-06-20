{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      upgrade-system = "cd $HOME/phronexia && git pull --rebase && sudo nixos-rebuild switch";
    };
  };
}
