{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    GTK_THEME = "Tokyonight-Dark-B";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
