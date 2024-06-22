{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
