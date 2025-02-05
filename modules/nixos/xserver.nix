{
  pkgs,
  vars,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,nl";
      excludePackages = [pkgs.xterm];
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${vars.username}";
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
