{
  inputs,
  vars,
  ...
}: {
  nix = {
    settings = {
      allowed-users = ["${vars.username}"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    overlays = [
      inputs.nixpkgs-firefox-darwin.overlay
      inputs.nur.overlays.default
    ];
  };
}
