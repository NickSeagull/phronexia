{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  environment.systemPackages = [
    (import ./themes/chicago95.nix)
  ];
}
