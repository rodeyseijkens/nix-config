{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    python3
    curl
    unzip
    xz

    ripgrep
    eza
    bat
    fzf
    fd
    fastfetch
    lazygit
    neovim

    nil
    lua-language-server
    bash-language-server
    yaml-language-server
    typescript-language-server
    prettierd
    alejandra

    gnupg
  ];
}
