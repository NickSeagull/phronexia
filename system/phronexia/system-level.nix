# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    ../../misc/steam.system.nix
    ../../misc/zsh.system.nix
    ../../config/i18n.nix
    ../../config/user.system.nix
    ../../config/timezone.nix
    ../../config/fonts.system.nix
    ../../config/nix.system.nix
    ../../hardware/power-management.nix
    ../../hardware/sound.nix
    ../../hardware/bootloader.nix
    ../../hardware/backlight.nix
    ../../hardware/location.nix
    ../../hardware/network.nix
    ../../services/desktop.nix
    ../../services/login.nix
    ../../services/ipc.nix
  ];

  networking.hostName = "phronexia";
  system.stateVersion = "23.11";


  # Rotate the screen correctly
  services.xserver = {
    xrandrHeads = [
      {
        output = "DSI-1";
        primary = true;
        monitorConfig = ''
          	  Option "Rotate" "right"
          	'';
      }
    ];
  };


}
