{
  description = "My NixOS configuration";

  # nixConfig = {
  #   extra-substituters = ["https://helix.cachix.org"];
  #   extra-trusted-public-keys = ["helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="];
  # };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixOS hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # helix
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, helix, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      helix-overlay = final: prev: {
        helix = helix.packages.${system}.default;
      };
    in
    {
      nixosConfigurations = {
        x1c9 = nixosSystem {
          inherit system;

          modules = [
            ./nixos/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          ];

          specialArgs = { inherit nixpkgs; };
        };
      };

      homeConfigurations = {
        sun = homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
            {
              nixpkgs.overlays = [
                helix-overlay
              ];
            }
          ];
        };
      };

      devShells.${system}.default = with pkgs; mkShellNoCC {
        packages = [
          home-manager
        ];
      };

      templates = {
        go = {
          path = ./templates/go;
          description = "Go development environment";
        };

        node = {
          path = ./templates/node;
          description = "Node development environment";
        };

        rust = {
          path = ./templates/rust;
          description = "Rust development environment";
        };

        flutter = {
          path = ./templates/flutter;
          description = "Flutter development environment";
        };
      };
    };
}
