{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    envExtra = ''
      # Add any extra environment variables or configuration settings here
    '';
  };
}
