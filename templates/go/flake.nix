{
  description = "Go development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      goose = with pkgs; buildGoModule rec {
        pname = "goose";
        version = "3.10.0";

        src = fetchFromGitHub {
          owner = "pressly";
          repo = "goose";
          rev = "v${version}";
          sha256 = "sha256-BtP1oYvIYfyMohq24LA5m3O6VmxBdOmkCHrnFZrMh4M=";
          # xh --download https://www.github.com/pressly/goose/archive/v3.10.0.tar.gz
          # tar zxvf goose-3.10.0.tar.gz
          # nix hash path goose-3.10.0
        };

        vendorSha256 = "sha256-ax6wBFl2XUNKMsVTpJO53cpIjMq+xI3BgIGSWkXXY4E=";

        doCheck = false;
      };
    in
    {
      devShells.${system}.default = with pkgs; mkShellNoCC {
        packages = [
          go
          gopls
          delve
          go-tools
          goose
        ];
      };
    };
}
