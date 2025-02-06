{
  hostname,
  vars,
  pkgs,
  ...
}: {
  nix.package = pkgs.nix;

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  networking = {
    hostName = hostname;
    localHostName = hostname;
  };

  users.users.${vars.username}.home = "/Users/${vars.username}";

  system.stateVersion = 4;
}
