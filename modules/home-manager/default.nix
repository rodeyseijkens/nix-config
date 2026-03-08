{
  hostname,
  vars,
  ...
}: {
  imports = [
    (./. + "/hosts/${hostname}")
    ./shared
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # Hide "last login" message on new terminal.
  home.file.".hushlogin".text = "";

  xdg.enable = true;

  home = {
    username = vars.username;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };
}
