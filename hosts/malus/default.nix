{
  hostname,
  vars,
  pkgs,
  ...
}: {
  nix.enable = true;

  nix.package = pkgs.nix;

  nixpkgs.hostPlatform = "aarch64-darwin";

  networking = {
    hostName = hostname;
    localHostName = hostname;
  };

  users.users.${vars.username}.home = "/Users/${vars.username}";

  system.stateVersion = 5;
}
