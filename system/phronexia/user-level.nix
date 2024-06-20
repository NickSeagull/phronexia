{ config, pkgs, lib, ... }: with builtins;
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

}
