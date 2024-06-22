{ config, pkgs, lib, chicago95, ... }:
{
  gtk.theme = {
    name = "Chicago95";
    package = chicago95.defaultPackage.x86_64-linux;
  };
}
