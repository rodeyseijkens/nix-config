{
  hostname,
  vars,
  ...
}: {
  imports = [
    (./. + "/hosts/${hostname}")
    ./shared
  ];

  programs.home-manager.enable = true;

  # Hide "last login" message on new terminal.
  home.file.".hushlogin".text = "";

  home = {
    username = vars.username;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };
}
