{chicago95}:
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Chicago95";
      package = chicago95;
    };
  };
}
