{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ## CLI utility
    curl # download utility
    entr # perform action when file change
    eza # ls replacement
    fd # find replacement
    ffmpeg
    file # Show file information
    gnupg # gpg
    imv # image viewer
    ncdu # disk space
    nitch # systhem fetch util
    nix-prefetch-github
    openssl # ssl
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    ripgrep # grep replacement
    unzip # unzip utility
    wget # download utility
    xdg-utils # xdg utilities
    xz # xz compression
    yazi # terminal file manager
    yt-dlp-light # audio/video downloader

    # Python
    python3
    python312Packages.ipython

    # Language servers and formatters
    alejandra # nix formatter
    bash-language-server
    lua-language-server
    nil # nix language server
    prettierd # formatter
    typescript-language-server
    yaml-language-server
  ];
}
