{
  description = "Node development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # https://lazamar.co.uk/nix-versions/
    nodejs_18_15_0.url = "github:NixOS/nixpkgs/1b7a6a6e57661d7d4e0775658930059b77ce94a4";

    # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";
  };

 outputs = { self, nixpkgs, nodejs_18_15_0, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          inherit system;
        };
        pinnedPkgs = import nodejs_18_15_0 {
          inherit system;
        };
      in
      {
        devShells.default = with pkgs; mkShellNoCC {
          buildInputs = [
            pinnedPkgs.nodejs
          ];
        };
      }
    );
}
