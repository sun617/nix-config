{
  description = "Flutter development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
      androidComposition = pkgs.androidenv.composeAndroidPackages {
        buildToolsVersions = [ "30.0.3" ];
        platformVersions = [ "33" ];
      };
      androidSdk = androidComposition.androidsdk;
    in
    {
      devShells.${system}.default = with pkgs; mkShellNoCC {
        packages = [
          flutter
          jdk17
          androidSdk
        ];

        ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
      };
    };
}
