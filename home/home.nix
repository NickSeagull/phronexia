{ config, pkgs, lib, ... }: with builtins;
let
  xournalpp = import ../programs/xournalpp.nix { inherit config pkgs; };
  obs-studio = import ../programs/obs-studio.nix { inherit config pkgs; };
  ffmpeg = import ../programs/ffmpeg.nix { inherit config pkgs; };
  ticktick = import ../programs/ticktick.nix { inherit config pkgs; };
  vlc = import ../programs/vlc.nix { inherit config pkgs; };
  steam = import ../programs/steam.nix { inherit config pkgs; };
  obsidian = import ../programs/obsidian.nix { inherit config pkgs; };
  inkscape = import ../programs/inkscape.nix { inherit config pkgs; };
  gimp = import ../programs/gimp.nix { inherit config pkgs; };
in
{
  imports = [
    ../programs/git.nix
    ../programs/vscodium.nix
    ../programs/kitty.nix
    ../programs/firefox.nix
    ../programs/neovim.nix
    ../programs/xournalpp.nix
    ../programs/obs-studio.nix
    ../programs/ffmpeg.nix
    ../programs/ticktick.nix
    ../programs/vlc.nix
    ../programs/steam.nix
    ../programs/obsidian.nix
    ../programs/inkscape.nix
    ../programs/gimp.nix

    # Services
    ../services/redshift.nix

    # Config
    ../config/home-manager.nix
    ../config/session-variables.nix
    ../config/user.nix
  ];

  # home.packages = lib.mkMerge [
  #   xournalpp.home.packages
  #   obs-studio.home.packages
  #   ffmpeg.home.packages
  #   ticktick.home.packages
  #   vlc.home.packages
  #   steam.home.packages
  #   obsidian.home.packages
  #   inkscape.home.packages
  #   gimp.home.packages
  # ];
}
