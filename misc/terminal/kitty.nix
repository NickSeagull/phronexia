{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerdfonts;
      size = 16;
      name = "BigBlueTerm437 Nerd Font";
    };
    extraConfig = ''
      background       #1e2127
      foreground       #abb2bf
      selection_foreground #1e2127
      selection_background #abb2bf

      cursor           #528bff
      cursor_text_color #1e2127

      color0           #282c34
      color1           #e06c75
      color2           #98c379
      color3           #e5c07b
      color4           #61afef
      color5           #c678dd
      color6           #56b6c2
      color7           #abb2bf
      color8           #5c6370
      color9           #e06c75
      color10          #98c379
      color11          #e5c07b
      color12          #61afef
      color13          #c678dd
      color14          #56b6c2
      color15          #ffffff

      tab_bar_edge     bottom
    '';
  };
}
