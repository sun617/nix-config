{ ... }:

{
  imports = [
    ../../../modules/nixos/server
    ./tailscale.nix
  ];

  networking.hostName = "um690slim";
}
