{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    xournalpp
    obs-studio
    ffmpeg_7-full
    ticktick
    vlc
    neofetch
    btop
    krita
    cool-retro-term
    discord
    devenv
    flatpak
    ardour
    gnome.gnome-software
  ];

  # stylix.image = /home/nick/img/landing_site.png;
  # stylix.polarity = "dark";
  # stylix.opacity.terminal = 0.85;
  # stylix.fonts = {

  #   monospace = {
  #     package = pkgs.nerdfonts;
  #     name = "BigBlueTerm437 Nerd Font";
  #   };

  #   emoji = {
  #     package = pkgs.noto-fonts-emoji;
  #     name = "Noto Color Emoji";
  #   };

  #   serif = {
  #     package = pkgs.dejavu_fonts;
  #     name = "DejaVu Serif";
  #   };

  #   # sansSerif = {
  #   #   package = pkgs.dejavu_fonts;
  #   #   name = "DejaVu Sans";
  #   # };

  #   # sansSerif = config.stylix.fonts.monospace;

  # };

  # stylix.targets = {
  #   firefox.enable = true;
  # };

  programs = {
    firefox = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "NickSeagull";
      userEmail = "git@nickseagull.dev";
      delta.enable = true;
      lfs.enable = true;
      aliases = {
        p = "push";
        co = "checkout";
        c = "commit";
      };
      extraConfig = {
        init = {
	  defaultBranch = "main";
	};
      };
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      envExtra = ''
      '';
    };

    # Nice, fast terminal
    kitty = {
      enable = true;
      settings = {
        hide_window_decorations = "yes";
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      mutableExtensionsDir = true;
      extensions = with pkgs.vscode-extensions; [
        vspacecode.vspacecode
        vspacecode.whichkey
      ];
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nick/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
    NIXPKGS_ALLOW_UNFREE="1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
