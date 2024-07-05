{ config, pkgs, ... }:

{
  sound.enable = true;
  musnix.enable = true;
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
