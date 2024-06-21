{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  # Enable network discovery
  services.avahi.enable = true;
}
