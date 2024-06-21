{ config, pkgs, ... }:
/*
* The responsibility of this Nix module is to configure and enable Home Manager with specific
* settings. It allows the use of unfree packages, sets the state version for Home Manager, and
* activates Home Manager for managing the user's home directory configuration.
*/
{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  home-manager.backupFileExtension = "bak";
}
