{
  description = "PHP development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # PHPs
    phps.url = "github:fossar/nix-phps";
    phps.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, phps, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        custom-php = phps.packages.${system}.php74.buildEnv {
          extensions = { enabled, all }: enabled ++ (with all; [
            memcached
            xdebug
          ]); 
          extraConfig = ''
            date.timezone = Asia/Tokyo
            
            xdebug.mode = debug
          '';
        };
      in
      {
        devShells.default = with pkgs; mkShellNoCC {
          buildInputs = [
            custom-php
          ];
        };
      }
    );
}
