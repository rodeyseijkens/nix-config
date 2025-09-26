{system, ...}: let
  systemSpecificRebuildCmd =
    if (system == "aarch64-darwin")
    then "darwin-rebuild"
    else "sudo nixos-rebuild";
in {
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      cat = "bat";
      # nano = "micro";
      code = "code";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      y = "yazi";
      dsize = "du -hs";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";
      sudo = "sudo TERMINFO=\"$TERMINFO\"";
      ssh = "kitten ssh";

      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nix-config && code ~/nix-config && clear";
      ns = "nom-shell --run zsh";
      nix-switch = "nh os switch";
      nix-update = "nix flake update --option access-tokens \"github.com=$(gh auth token)\"";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
    };
  };
}
