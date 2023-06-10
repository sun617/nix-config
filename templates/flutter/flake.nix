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
      android = pkgs.androidenv.composeAndroidPackages {
        platformVersions = [ "30" "31" "32" "33" ];
      };
    in
    {
      devShells.${system}.default = with pkgs; mkShellNoCC {
        packages = [
          flutter
          jdk
          android.platform-tools
        ];

        ANDROID_SDK_ROOT = "${android.androidsdk}/libexec/android-sdk";
        JAVA_HOME = pkgs.jdk;
      };
    };
}
