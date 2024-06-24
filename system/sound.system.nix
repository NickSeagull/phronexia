{ config, pkgs, ... }:

{
  sound.enable = true;
  security.rtkit.enable = true;

  environment.systemPackages = [
    pavucontrol
  ];
}
