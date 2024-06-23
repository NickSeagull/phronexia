{ chicago95 }:
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = chicago95.defaultPackage.x86_64-linux;
    };
  };

  home.sessionVariables =
    {
      GTK_THEME = "Chicago95";
    };
}
