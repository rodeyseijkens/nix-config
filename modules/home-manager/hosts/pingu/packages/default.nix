{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    imv # image viewer
    nitch # systhem fetch util
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
  ];
}
