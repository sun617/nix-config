{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";
      username = "sun";
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
        ${username} = homeManagerConfiguration {
          inherit system username;
          homeDirectory = "/home/${username}";

          configuration = import ./home-manager/home.nix;
          stateVersion = "22.05";
        };
      };
    };
}
