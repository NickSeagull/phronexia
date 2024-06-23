{ pkgs, chicago95, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = chicago95;
    };
  };
}
