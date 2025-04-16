{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixOS Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Nix Darwin
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Flakepak
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
  };

  outputs = { nixpkgs, nixos-hardware, nix-darwin, home-manager, nix-flatpak, ... }@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (nix-darwin.lib) darwinSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      pkgsForSystem = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        x1c9 = let
          system = "x86_64-linux";
        in 
        nixosSystem {
          inherit system;
          pkgs = pkgsForSystem system;

          modules = [
            ./hosts/x1c9/nixos
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
          ];

          specialArgs = { inherit nixpkgs; };
        };

        aix1pro = let
          system = "x86_64-linux";
        in
        nixosSystem {
          inherit system;
          pkgs = pkgsForSystem system;

          modules = [
            ./hosts/aix1pro/nixos
          ];

          specialArgs = { inherit nixpkgs; };
        };
      };

      darwinConfigurations = {
        m1max = let
          system = "aarch64-darwin";
        in
        darwinSystem {
          inherit system;
          pkgs = pkgsForSystem system;

          modules = [
            ./hosts/m1max/darwin
          ];

          specialArgs = { inherit nixpkgs; };
        };
      };

      homeConfigurations = {
        x1c9 = let 
          system = "x86_64-linux";
        in  
        homeManagerConfiguration {
          pkgs = pkgsForSystem system;
          modules = [
            nix-flatpak.homeManagerModules.nix-flatpak
            ./hosts/x1c9/home
          ];
        };

        aix1pro = let
          system = "x86_64-linux";
        in
        homeManagerConfiguration {
          pkgs = pkgsForSystem system;
          modules = [
            nix-flatpak.homeManagerModules.nix-flatpak
            ./hosts/aix1pro/home
          ];
        };

        m1max = let 
          system = "aarch64-darwin";
        in
        homeManagerConfiguration {
          pkgs = pkgsForSystem system;
          modules = [
            ./hosts/m1max/home
          ];
        };
      };

      templates = {
        flutter = {
          path = ./templates/flutter;
          description = "Flutter development environment";
        };

        go = {
          path = ./templates/go;
          description = "Go development environment";
        };

        node = {
          path = ./templates/node;
          description = "Node development environment";
        };

        php = {
          path = ./templates/php;
          description = "PHP development environment";
        };

        ruby = {
          path = ./templates/ruby;
          description = "Ruby development environment";
        };

        rust = {
          path = ./templates/rust;
          description = "Rust development environment";
        };
      };
    };
}
