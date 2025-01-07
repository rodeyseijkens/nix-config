{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${system}".default
    inputs.home-manager.packages."${system}".default
  ];
}
