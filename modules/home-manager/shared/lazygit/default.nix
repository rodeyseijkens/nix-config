{
  homeManagerConfig,
  config,
  ...
}: {
  programs.lazygit.enable = true;

  home.file."./.config/lazygit/" = {
    source = ./config;
    recursive = true;
  };
}
