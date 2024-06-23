# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
    ../../system/bootloader.system.nix
    ../../system/backlight.system.nix
    ../../system/package-management.system.nix
    ../../system/location.system.nix

    ../../desktop/desktop-manager.system.nix
    ../../desktop/login-screen.system.nix
    ../../desktop/fonts.system.nix

    ../../services/ipc.nix
  ];

  networking.hostName = "phronexia";

  # Rotate the screen correctly
  services.xserver = {
    dpi = lib.mkForce 223;
    xrandrHeads = [
      {
        output = "DSI-1";
        primary = true;
        monitorConfig = ''
          Option "Rotate" "right"
          Option "Scale" "0.75x0.75"
        '';
      }
    ];
  };

  environment.variables = {
    # GDK_SCALE = "2";
    # GDK_DPI_SCALE = "2";
    # _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

}
