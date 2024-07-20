{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    armcord # A better Discord client that doesn't eat your RAM and supports screen sharing on Linux
  ];
}
