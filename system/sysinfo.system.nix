{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    busybox
  ];
}
