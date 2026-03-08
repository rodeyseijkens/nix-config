{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    curl # download utility
    entr
    eza # ls replacement
    fd
    ffmpeg
    file # Show file information
    gnupg # gpg
    lazygit # terminal git UI
    ncdu # disk space
    nix-prefetch-github
    openssl # ssl
    ripgrep # grep replacement
    unzip # unzip utility
    wget # download utility
    xdg-utils # xdg utilities
    xz # xz compression
    yazi # terminal file manager
    yt-dlp-light # audio/video downloader

    # Node.js
    volta

    # Python
    python3
    python312Packages.ipython

    # Language servers and formatters
    inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system}
  ];
}
