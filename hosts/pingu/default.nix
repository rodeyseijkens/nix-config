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

  # Driver Options
  drivers.nvidiagpu.enable = true;

  system.stateVersion = "24.11";
}
