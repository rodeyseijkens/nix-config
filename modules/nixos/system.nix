{
  inputs,
  vars,
  pkgs,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];

  nix = {
    settings = {
      allowed-users = ["${vars.username}"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
