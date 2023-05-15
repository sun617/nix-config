{
  description = "Node development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = with pkgs; mkShellNoCC {
        packages = [
          nodejs-slim-16_x
        ];
      };
    };
}
