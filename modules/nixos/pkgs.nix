{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    dconf-editor
    killall
    libnotify
    man-pages
    wl-clipboard
    gifsicle
    zenity
    satty

    cbonsai
    cmatrix
    pipes
    sl
    tty-clock

    bleachbit
    libresprite
    pwvucontrol
    mission-center

    winetricks
    wineWow64Packages.wayland
    proton-pass-cli

    imv # image viewer
    nitch # systhem fetch util
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players

    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.pathsToLink = ["/share/zsh"];
}
