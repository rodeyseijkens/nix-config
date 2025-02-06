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
      reload = ". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc' && sleep 1 && clear";
      #   cat = "bat";
      #   nano = "micro";
      #   code =
      #     if (config.modules.vscodium.enable)
      #     then "codium"
      #     else "code";
      #   diff = "delta --diff-so-fancy --side-by-side";
      #   less = "bat";
      y = "yazi";
      #   py = "python";
      #   ipy = "ipython";
      #   icat = "kitten icat";
      dsize = "du -hs";
      #   pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nix-config && code ~/nix-config";
      nix-build = "cd ~/nix-config && ${systemSpecificRebuildCmd} switch --flake";
      ns = "nom-shell --run zsh";
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";

      # python
      #   piv = "python -m venv .venv";
      #   psv = "source .venv/bin/activate";

      # git
      g = "lazygit";
      gf = "onefetch --number-of-file-churns 0 --no-color-palette";
      ga = "git add";
      gaa = "git add --all";
      gs = "git status";
      gb = "git branch";
      gm = "git merge";
      gd = "git diff";
      gpl = "git pull";
      gplo = "git pull origin";
      gps = "git push";
      gpsf = "git push --force";
      gpso = "git push origin";
      gpst = "git push --follow-tags";
      gcl = "git clone";
      gc = "git commit";
      gcm = "git commit -m";
      gcma = "git add --all && git commit -m";
      gtag = "git tag -ma";
      gch = "git checkout";
      gchb = "git checkout -b";
      glog = "git log --oneline --decorate --graph";
      glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
      glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
      glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
    };
  };
}
