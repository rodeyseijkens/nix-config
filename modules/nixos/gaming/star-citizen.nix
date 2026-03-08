{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
with lib; let
  cfg = config.module.star-citizen;
in {
  options.module.star-citizen = {
    enable = mkEnableOption "Enable Star Citizen";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.nix-citizen.packages.${pkgs.stdenv.hostPlatform.system}.rsi-launcher
    ];
    boot.kernel.sysctl = {
      "fs.file-max" = 524288;
    };
  };
}
