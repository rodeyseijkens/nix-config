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
      inputs.nur.overlays.default
    ];
  };
}
