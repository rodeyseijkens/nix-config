{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.firefox;
  searchConfig = import ./profiles/search.nix;
in {
  options.modules.firefox = {enable = mkEnableOption "firefox";};
  config = mkIf cfg.enable {
    home = {
      file."firefox-gnome-theme" = {
        target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
        source = inputs.firefox-gnome-theme;
      };
    };

    programs.firefox = {
      enable = true;
      profiles.default = {
        name = "Default";
        settings = {
          "browser.tabs.loadInBackground" = true;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "gnomeTheme.hideSingleTab" = true;
          "gnomeTheme.bookmarksToolbarUnderTabs" = true;
          "gnomeTheme.normalWidthTabs" = false;
          "gnomeTheme.tabsAsHeaderbar" = false;
        };
        search = searchConfig.search;
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
        '';
        userContent = ''
          @import "firefox-gnome-theme/userContent.css";
        '';
      };
    };
  };
}
