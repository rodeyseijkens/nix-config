{
  description = "homelab flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    nix-homebrew,
    home-manager,
    agenix,
    impermanence,
    ...
  } @ inputs: let
    inherit (self) outputs;

    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
    ];

    nixosModules = import ./modules/nixos;
    darwinModules = import ./modules/darwin;
    homeManagerModules = import ./modules/home-manager;

    legacyPackages = forAllSystems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

    buildHomeManagerConfig = hostname: let
      rootPath = "/etc/nixos/modules/home-manager";
      hostPath = "${rootPath}/hosts/${hostname}";
      sharedPath = "${rootPath}/shared";
    in {
      linkHostApp = config: app: config.lib.file.mkOutOfStoreSymlink "${hostPath}/${app}/config";
      linkSharedApp = config: app: config.lib.file.mkOutOfStoreSymlink "${sharedPath}/${app}/config";
    };

    createNixOS = system: hostname: (
      let
        vars = import (./. + "/hosts/${hostname}/vars.nix");
        specialArgs = {
          inherit
            hostname
            inputs
            outputs
            system
            vars
            ;
        };
        modules =
          (builtins.attrValues nixosModules)
          ++ [
            (./. + "/hosts/${hostname}")
            agenix.nixosModules.default
            impermanence.nixosModules.impermanence
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.username}" = homeManagerModules;
              home-manager.extraSpecialArgs =
                specialArgs
                // {
                  homeManagerConfig = buildHomeManagerConfig hostname;
                };
            }
          ];
      in
        nixpkgs.lib.nixosSystem {inherit system modules specialArgs;}
    );

    createDarwin = system: hostname: (
      let
        vars = import (./. + "/hosts/${hostname}/vars.nix");
        specialArgs = {
          inherit
            hostname
            inputs
            outputs
            system
            vars
            ;
        };
        modules =
          (builtins.attrValues darwinModules)
          ++ [
            (./. + "/hosts/${hostname}")
            agenix.nixosModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.username}" = homeManagerModules;
              home-manager.extraSpecialArgs =
                specialArgs
                // {
                  homeManagerConfig = buildHomeManagerConfig hostname;
                };
            }
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                user = vars.username;
                enableRosetta = true;
                autoMigrate = true;
                # mutableTaps = false;
              };
            }
          ];
      in
        nix-darwin.lib.darwinSystem {inherit specialArgs modules;}
    );
  in {
    inherit legacyPackages;

    nixosConfigurations = {
      pingu = createNixOS "x86_64-linux" "pingu";
    };

    darwinConfigurations = {
      malus = createDarwin "aarch64-darwin" "malus";
    };

    darwinPackages = self.darwinConfigurations.${outputs.networking.hostName}.pkgs;
  };
}
