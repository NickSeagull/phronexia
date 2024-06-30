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
    (import ../../system/bootloader.system.nix {inherit chicago95; })
    ../../system/backlight.system.nix
    ../../system/package-management.system.nix
    ../../system/location.system.nix

    ../../desktop/desktop-manager.system.nix
    ../../desktop/login-screen.system.nix
    ../../desktop/fonts.system.nix

    ../../services/ipc.nix
  ];

  networking.hostName = "phronexia";

  environment.systemPackages = [
    (pkgs.writeScriptBin "set-gpd-pocket3-mode" ''
      #!/bin/sh
      xrandr --newmode "1280x800_60.00" 83.50 1280 1352 1480 1680 800 803 809 831 -hsync +vsync
      xrandr --addmode DSI1 1280x800_60.00
      xrandr --output DSI1 --mode 1280x800_60.00
    '')
  ];

  # Rotate the screen correctly
  services.xserver = {
    dpi = lib.mkForce 223;
    xrandrHeads = [
      {
        output = "DSI-1";
        primary = true;
        monitorConfig = ''
          Option "Rotate" "right"
        '';
      }
    ];
    displayManager = {
      sessionCommands = ''
        set-gpd-pocket3-mode
      '';
    };


  };

  environment.variables = {
    # GDK_SCALE = "2";
    # GDK_DPI_SCALE = "2";
    # _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

}
