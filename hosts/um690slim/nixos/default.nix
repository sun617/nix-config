{ ... }:

{
  imports = [
    ../../../modules/nixos/server
    ./hardware-configuration.nix
    ./tailscale.nix
  ];

  networking.hostName = "um690slim";
}
