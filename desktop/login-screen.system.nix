{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm.enable = true;
#  services.xserver.displayManager.lightdm.extraSeatDefaults = ''
#    display-setup-script=xrandr --output DSI1 --rotate right
#  '';
}
