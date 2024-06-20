{ config, pkgs, lib, ... }: with builtins;
{
  imports = [
    ../../applications/git.nix
    ../../applications/vscodium.nix
    ../../applications/kitty.nix
    ../../applications/firefox.nix
    ../../applications/neovim.nix
    ../../applications/xournalpp.nix
    ../../applications/obs-studio.nix
    ../../applications/ffmpeg.nix
    ../../applications/ticktick.nix
    ../../applications/vlc.nix
    ../../applications/steam.nix
    ../../applications/obsidian.nix
    ../../applications/inkscape.nix
    ../../applications/gimp.nix

    # Services
    ../../services/night-light.nix

    # Config
    ../../config/home-manager.nix
    ../../config/session-variables.nix
    ../../config/user.nix
  ];

}
