{
  age = import ./age.nix;
  flatpak = import ./flatpak.nix;
  locale = import ./locale.nix;
  networking = import ./networking.nix;
  nvidia = import ./nvidia.nix;
  pkgs = import ./pkgs.nix;
  security = import ./security.nix;
  services = import ./services.nix;
  sound = import ./sound.nix;
  system = import ./system.nix;
  users = import ./users.nix;
  xserver = import ./xserver.nix;
  steam = import ./steam.nix;
  wayland = import ./wayland.nix;
}
