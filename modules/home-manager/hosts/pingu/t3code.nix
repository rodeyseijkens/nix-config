{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.t3code;
in {
  options.modules.t3code = {enable = lib.mkEnableOption "t3code";};
  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.t3code.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
