{ chicago95 }:
{ config, pkgs, ... }:
let pkg =chicago95.defaultPackage.x86_64-linux;
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = pkg;
    };
  };

  home.sessionVariables =
    {
      GTK_THEME = "Chicago95";
    };

  xdg.configFile = {
    "cinnamon".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/cinnamon";
    "gnome-shell".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gnome-shell";
    "gtk-2.0".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-2.0";
    "gtk-3.0".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-3.0";
    "metacity-1".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/metacity-1";
    "misc".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/misc";
    "xfce-notify-4.0".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/xfce-notify-4.0";
    "xfwm4".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/xfwm4";
    "xfwm4_hidpi".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/xfwm4_hidpi";
    "gtk-3.22".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-3.22";
    "gtk-3.24".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-3.24";
    "index.theme".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/index.theme";
  };
  
}
