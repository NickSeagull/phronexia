{ chicago95 }:
{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    theme = "Chicago95";
    themePackages = [ chicago95 ];
  };
}
