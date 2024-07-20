# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ chicago95 }:
{ config, pkgs, lib, ... }:
{
  imports = [
    ../../multimedia/games/steam.system.nix

    ../../misc/terminal/zsh.system.nix

    ../../config/user.system.nix

    ../../network/discovery.system.nix
    ../../network/management.system.nix

    ../../system/power-management.system.nix
    ../../system/sound.system.nix
    (import ../../system/bootloader.system.nix { inherit chicago95; })
    ../../system/backlight.system.nix
    ../../system/file-systems.system.nix
    ../../system/package-management.system.nix
    ../../system/location.system.nix
    ../../system/sysinfo.system.nix
    ../../system/windows-compat.system.nix

    ../../desktop/desktop-manager.system.nix
    ../../desktop/login-screen.system.nix
    ../../desktop/fonts.system.nix
    ../../desktop/keyring.system.nix

    ../../services/ipc.nix
  ];

  networking.hostName = "baphomet";

  hardware.pulseaudio.enable = true;

  # Rotate the screen correctly
  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };
  environment.systemPackages = with pkgs; [
  ];

  environment.sessionVariables = {
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };


}
