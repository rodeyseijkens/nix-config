{
  system,
  config,
  ...
}: let
  home = config.home.homeDirectory;
in {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks =
      if (system != "aarch64-darwin")
      then {
        "*" = {
          addKeysToAgent = "yes";
          serverAliveInterval = 60;
        };
        "github.com" = {
          hostname = "github.com";
          user = "rodeyseijkens";
          identityFile = "${home}/.ssh/id_personal";
        };
      }
      else {
        "*" = {
          addKeysToAgent = "yes";
          serverAliveInterval = 60;
        };
        "github.com-personal" = {
          hostname = "github.com";
          user = "rodeyseijkens";
          identityFile = "${home}/.ssh/id_personal";
        };
      };
  };
}
