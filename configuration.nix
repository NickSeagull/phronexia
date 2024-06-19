# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "nick" ];

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


  system.autoUpgrade = {
    enable = true;
    dates = "minutely";
    flags = [
      "--no-write-lock-file"
      "-L"
    ];
    flake = "https://github.com/NickSeagull/phronexia";
  };

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
  # services.geoclue2.enable = true;
  # services.geoclue2.appConfig = {
  #  isAllowed = true;
  #  isSystem = true;
  #  users = [ "nick" ];
  # };
  services.redshift.enable = true;

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


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.fprintd = {
    enable = true;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    home-manager
    fprintd

    busybox
    gcc
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
