{ config, pkgs, ... }:

{
      fonts.packages = with pkgs; [
    nerdfonts
    meslo-lgs-nf
    jetbrains-mono
    font-awesome
    comic-mono
    material-icons
    terminus_font_ttf
    dejavu_fonts
    fixedsys-excelsior
  ];
}
