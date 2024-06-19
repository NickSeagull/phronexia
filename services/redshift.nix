{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    dawnTime = "07:00";
    duskTime = "21:00";
    temperature.night = 2000;
  };
}
