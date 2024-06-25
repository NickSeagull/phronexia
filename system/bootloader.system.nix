{ chicago95 }:
{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "quiet" ];

  boot.plymouth = {
    enable = true;
    theme = "Chicago95";
    themePackages = [ chicago95.defaultPackage.x86_64-linux ];
  };
}
