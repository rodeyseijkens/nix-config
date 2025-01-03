{
  pkgs,
  vars,
  lib,
  ...
}: {
  users.groups = {
    "${vars.username}" = {
      gid = vars.defaultUserGID;
    };
  };

  users.users = {
    "${vars.username}" = {
      uid = vars.defaultUserUID;
      group = "${vars.username}";
      description = "${vars.fullname}";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
