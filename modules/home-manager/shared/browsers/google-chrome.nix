{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
    # extensions = [
    #   {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
    #   {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # vimium-c
    # ];
  };
}
