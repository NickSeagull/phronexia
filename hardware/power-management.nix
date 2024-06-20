{ config, pkgs, ... }:

{
  powerManagement.enable = true;

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

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    };
  };
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;

  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };

}
