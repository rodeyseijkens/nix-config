{
  system,
  config,
  ...
}: let
  home = config.home.homeDirectory;
in {
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      ServerAliveInterval 60
    '';
    matchBlocks =
      if (system != "aarch64-darwin")
      then {
        "github.com" = {
          hostname = "github.com";
          user = "rodeyseijkens";
          identityFile = "${home}/.ssh/id_personal";
        };
      }
      else {
        "github.com-personal" = {
          hostname = "github.com";
          user = "rodeyseijkens";
          identityFile = "${home}/.ssh/id_personal";
        };
      };
  };
}
