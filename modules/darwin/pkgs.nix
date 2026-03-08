{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
