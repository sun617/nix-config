{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # helix
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, helix, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

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
          ];
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
    };
}
