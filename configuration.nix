# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      <home-manager/nixos>
      <nixos-hardware/gpd/pocket-3>
      /etc/nixos/hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "nick" ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [

    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "phronexia"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Atlantic/Canary";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  services.avahi.enable = true;
  services.geoclue2.enable = true;
  services.geoclue2.appConfig = { };

  programs.light.enable = true;

  programs.steam.enable = true;

  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };


  services.acpid = {
    enable = true;
    lidEventCommands =
      ''
        export PATH=$PATH:/run/current-system/sw/bin

        lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $NF}')
        if [ $lid_state = "closed" ]; then
            systemctl suspend
        fi
      '';

    powerEventCommands =
      ''
        systemctl suspend
      '';
  };

  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    };
  };
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;






  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "intl";
    xrandrHeads = [
      {
        output = "DSI-1";
        primary = true;
        monitorConfig = ''
          	  Option "Rotate" "right"
          	'';
      }
    ];
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  location = {
    provider = "geoclue2";
  };

  services.dbus.enable = true;

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    description = "nick";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.eve = { pkgs, ... }: {

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
      ardour
    ];

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
      NIXPKGS_ALLOW_UNFREE = "1";
    };

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit # text editor
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  services.fprintd = {
    enable = true;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    home-manager
    fprintd

    busybox
    gcc

    gnomeExtensions.screen-rotate
    gnomeExtensions.burn-my-windows
    gnomeExtensions.unite
    gnomeExtensions.paperwm
    gnomeExtensions.compact-top-bar
    gnomeExtensions.always-allow-onscreen-keyboard
    gnomeExtensions.enhanced-osk
    gnomeExtensions.no-titlebar-when-maximized
    gnomeExtensions.open-bar
    gnome.gnome-tweaks

  ];

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

  sound.enable = true;

  security.rtkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
