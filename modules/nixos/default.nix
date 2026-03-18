{
  hostname,
  vars,
  ...
}: {
  imports = [
    ./bootloader
    ./btop
    ./drivers
    ./flatpak
    ./gaming
    ./hardware
    ./locale
    ./networking
    ./nh
    ./pipewire
    ./pkgs
    ./program
    ./security
    ./secrets
    ./services
    ./system
    ./users
    ./wayland
    ./xserver
  ];
}
