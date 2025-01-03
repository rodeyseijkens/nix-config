{
  age = import ./age.nix;
  locale = import ./locale.nix;
  networking = import ./networking.nix;
  pkgs = import ./pkgs.nix;
  system = import ./system.nix;
  users = import ./users.nix;
}
