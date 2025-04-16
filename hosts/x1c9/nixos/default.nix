{ ... }:

{
  imports = [
    ../../../modules/nixos
    ./hardware-configuration.nix
  ];

  networking.hostName = "x1c9";
}
