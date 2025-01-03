{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

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

    inputs.agenix.packages."${system}".default
    inputs.home-manager.packages."${system}".default
  ];

  programs.zsh.enable = true;

  environment.pathsToLink = ["/share/zsh"];
}
