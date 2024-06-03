# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/gpd/pocket-3>
      /etc/nixos/hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
  services.geoclue2.appConfig = {
    "gammastep" = {
      isAllowed = true;
      isSystem = false;
      users = [ "1000" ];
    };
  };

  services.physlock = {
    allowAnyUser = true;
    enable = true;
    muteKernelMessages = true;
  };

  programs.light.enable = true;

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
  };

  location = {
   provider = "geoclue2";
   # latitude = 28.03;
   # longitude = -15.41;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "where-is-my-sddm-theme";
    };
  };
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    description = "nick";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      gzdoom
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.waybar = {
    enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  home-manager
  where-is-my-sddm-theme

  gammastep
  brightnessctl
  hyprland
  wlr-protocols
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-wlr
  xwayland
  eww
  swww

  meson
  wayland-protocols
  wayland-utils
  wl-clipboard
  wlroots


  pavucontrol
  pipewire

  busybox
  gcc

  dunst
  libnotify

  networkmanagerapplet

  wofi
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    meslo-lgs-nf
    jetbrains-mono
    font-awesome
    comic-mono
    material-icons
    terminus_font_ttf
    fixedsys-excelsior
  ];

  sound.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
