{...}: {
  imports = [
    ./bat.nix # better cat command
    ./browsers # firefox, zen browser, and google chrome
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./kitty.nix # terminal
    ./nvim.nix # neovim editor
    ./nh # nix helper
    ./p10k/p10k.nix # zsh theme
    ./packages.nix # other packages
    ./spicetify.nix # spotify client
    ./ssh.nix # ssh client
    ./vscode.nix # vscode
    ./zsh # shell
  ];
}
