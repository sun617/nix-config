{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { home-manager, ... }:
    let
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";
      username = "sun";
    in
    {
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
