{vars, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./filesystems.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = vars.timeZone;

  users.users.${vars.username}.home = "/home/${vars.username}";

  networking = {
    networkmanager.enable = false;
  };

  powerManagement.cpuFreqGovernor = "performance";

  system.stateVersion = "24.11";

  drivers = {
    amdgpu.enable = false;
    nvidiagpu.enable = true;
  };

  core = {
    steam.enable = true;
    star-citizen.enable = true;
  };
}
