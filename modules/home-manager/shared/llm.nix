{
  inputs,
  pkgs,
  ...
}: let
  defaultModel = "openrouter/openrouter/free";
in {
  home.packages = with pkgs; [
    (llm.withPlugins {
      llm-openrouter = true;
    })
  ];

  xdg.configFile."io.datasette.llm/default_model.txt".text = "${defaultModel}\n";
}
