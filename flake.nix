{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Aws vpn client
    awsvpnclient.url = "github:ymatsiuk/awsvpnclient";
    awsvpnclient.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, awsvpnclient, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        x1c6 = nixosSystem {
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
                awsvpnclient.overlay
              ];
            }
          ];
        };
      };

      devShells.${system}.default = with pkgs; mkShell {
        packages = [
          pkgs.home-manager
        ];
      };
    };
}
