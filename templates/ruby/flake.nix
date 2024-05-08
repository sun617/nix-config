{
  description = "Ruby development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nixpkgs Ruby
    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
    nixpkgs-ruby.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-ruby, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            nixpkgs-ruby.overlays.default
          ];
          config = {
            permittedInsecurePackages = [ "openssl-1.1.1w" ];
          };
        };
      in
      {
        devShells.default = with pkgs; mkShellNoCC {
          buildInputs = [
            pkgs."ruby-3.0.3"
            pkg-config
            openssl
            libmysqlclient
          ];
        };
      }
    );
}
