{chicago95}:
{ config, pkgs, lib, ... }@inputs: with builtins;
{
  imports = [
    ../../coding/editor/neovim/default.nix
    ../../coding/editor/vscode/default.nix
    ../../coding/version-control/git.nix
    ../../coding/direnv.nix

    ../../misc/terminal/kitty.nix

    (import ../../desktop/themes/default.nix {inherit chicago95;} )

    ../../multimedia/video/ffmpeg.nix
    ../../multimedia/video/obs-studio.nix
    ../../multimedia/video/vlc.nix
    ../../multimedia/image/inkscape.nix
    ../../multimedia/image/gimp.nix
    ../../multimedia/games/steam.nix

    ../../network/browser.nix

    ../../productivity/notes/xournalpp.nix
    ../../productivity/notes/obsidian.nix
    ../../productivity/tasks/ticktick.nix
    ../../productivity/cloud-storage/nextcloud.nix

    ../../system/package-management.nix

    ../../services/night-light.nix

    ../../config/user.nix
  ];

}
