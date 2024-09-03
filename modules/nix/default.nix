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
      # https://github.com/NixOS/nix/pull/5002
      options = "--delete-older-than 10d";
    };
  };
}
