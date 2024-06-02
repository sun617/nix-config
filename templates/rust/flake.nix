{
  description = "Rust development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, fenix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        fenixStable = fenix.packages.${system}.stable.withComponents [
          "cargo"
          "clippy"
          "rust-std"
          "rustc"
          "rustfmt"
        ];
      in
      {
        devShells.default = with pkgs; mkShellNoCC {
          nativeBuildInputs = [
            fenixStable
            # gcc
            # pkg-config
            # openssl
            rust-analyzer
          ];
        };
      }
    );
}
