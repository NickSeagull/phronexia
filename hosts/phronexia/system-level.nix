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

  networking.hostName = "phronexia";

  hardware.pulseaudio.enable = true;

  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
  '';

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
    inputClassSections = [
      ''
        Identifier "calibration"
        MatchProduct "GXTP7380:00 27C6:0113"
        Option "SwapXY" "1"
        Option "TransformationMatrix" "0 1 0 -1 0 1 0 0 1"
      ''
    ];

    # 0 degrees: Option "TransformationMatrix" "0 1 0 -1 0 1 0 0 1"
    # 90 degrees:  Option "TransformationMatrix" "-1 0 1 0 -1 1 0 0 1"
    # 180 degrees: Option "TransformationMatrix" "0 -1 1 1 0 0 0 0 1"
    # 270 degrees: Option "TransformationMatrix" "1 0 0 0 1 0 0 0 1"

    displayManager.lightdm.extraSeatDefaults = ''
      display-setup-script=${ pkgs.xorg.xrandr }/bin/xrandr --output DSI1 --rotate right
    '';

  };
  environment.systemPackages = with pkgs; [
    xinput_calibrator
  ];

  environment.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
    QT_SCALE_FACTOR = "1";
    QT_FONT_DPI = "96";
  };



}
