{
  pkgs,
  vars,
  ...
}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/Users/${vars.username}/nix-config";
  };
}
