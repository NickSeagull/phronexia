{ config, pkgs, lib, ... }: with builtins;
let
  xournalpp = ../programs/xournalpp.nix {inherit config pkgs};
in {
  imports = [
    ../programs/zsh.nix
    ../programs/git.nix
    ../programs/vscodium.nix
    ../programs/kitty.nix
    ../programs/firefox.nix
    ../programs/neovim.nix
    ../services/redshift.nix
    ../config/session-variables.nix
  ];

  home.packages = lib.mkMerge [
    xournalpp.home.packages
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
