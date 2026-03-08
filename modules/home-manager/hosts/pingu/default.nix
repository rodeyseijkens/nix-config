{...}: {
  imports = [
    ./google-chrome.nix
    ./ghostty
    ./scripts
    ./walker
    ./waybar
    ./swaync
    ./swayosd.nix
    ./gtk.nix
    ./gnome.nix
    ./viewnior.nix
    ./tigervnc.nix
    ./tiled.nix
    ./nautilus.nix
    ./3d-printing.nix
    ./t3code.nix
    ./xdg-mimes.nix
    ./worktrunk.nix
  ];

  modules = {
    zen-browser.enable = true;
    vscode.enable = true;
    cursor-editor.enable = true;
    spicetify.enable = true;
    legcord.enable = true;
    obs-studio.enable = true;
    zed-editor.enable = true;
    tiled.enable = true;
    nautilus.enable = true;
    printing3d.enable = true;
    t3code.enable = true;
    worktrunk.enable = true;
  };
}
