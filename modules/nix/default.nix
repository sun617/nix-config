{ nixpkgs, ... }:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    registry = {
      nixpkgs.flake = nixpkgs;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };
  };
}
