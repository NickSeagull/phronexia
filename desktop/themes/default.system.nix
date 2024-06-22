{ config, pkgs, chicago95 }:
{
  environment.systemPackages = [ chicago95.defaultPackage.x86_64-linux ];
}
