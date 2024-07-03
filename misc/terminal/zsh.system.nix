{ config, pkgs, ... }:
/*
* This module is imported at system level, because it is the system shell,
*/
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      # A workflow that I usually do in my systems is to code from
      # the computer I'm currently at, and then just upgrade using this command
      upgrade-system = "cd $HOME/phronexia && git pull --rebase && sudo nixos-rebuild switch";

      # This is for quick edits at repos
      # TODO: Make this use the GPT commit message utility
      gcu = "git add . && git commit -m Update";
    };

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    ohMyZsh = {
      enable = true;
    };
  };
}
