{
  description = "Flutter development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };
        # https://github.com/NixOS/nixpkgs/issues/289936
        buildToolsVersionForAapt2 = "34.0.0-rc4";
        androidComposition = pkgs.androidenv.composeAndroidPackages {
          buildToolsVersions = [buildToolsVersionForAapt2 "30.0.3"];
          platformVersions = [ "34" "33" ];
          extraLicenses = [
            "android-googletv-license"
            "android-sdk-arm-dbt-license"
            # "android-sdk-license"
            "android-sdk-preview-license"
            "google-gdk-license"
            # "intel-android-extra-license"
            # "intel-android-sysimage-license"
            "mips-android-sysimage-license"
          ];
        };
        androidSdk = androidComposition.androidsdk;
      in
      {
        devShells.default = with pkgs; mkShellNoCC {
          buildInputs = [
            flutter
            jdk17
            androidSdk
          ];

          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
          GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${buildToolsVersionForAapt2}/aapt2";
        };
      }
    );
}
