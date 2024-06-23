{ config, pkgs, lib, chicago95, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = pkgs.chicago95;
    };
  };
}
