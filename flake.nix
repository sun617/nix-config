{
  description = "A Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      sun = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/sun";
        username = "sun";
        configuration.imports = [ ./home.nix ];
        stateVersion = "21.11";
      };
    };
    defaultPackage.x86_64-linux = inputs.self.homeConfigurations.sun.activationPackage;
  };
}
