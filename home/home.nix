{ config, pkgs, ... }: with builtins;
let
  configPath = ${home.homeDirectory}/phronexia;
in {
  imports = map (x: ${configPath}/x) [
    programs/zsh.nix
    programs/git.nix
    programs/vscodium.nix
    programs/kitty.nix
    programs/firefox.nix
    programs/neovim.nix
    services/redshift.nix
    config/session-variables.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
