{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.displayManager.lightdm.greeter.name = "lightdm-gtk-greeter";
  services.xserver.displayManager.lightdm.greeter.package = pkgs.lightdm_gtk_greeter;
}
