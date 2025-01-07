{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    killall

    inputs.agenix.packages."${system}".default
    inputs.home-manager.packages."${system}".default
  ];

  environment.pathsToLink = ["/share/zsh"];
}
