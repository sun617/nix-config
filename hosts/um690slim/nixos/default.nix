{ ... }:

{
  imports = [
    ../../../modules/nixos/server
    ./hardware-configuration.nix
    ./cloudflared.nix
    ./tailscale.nix
  ];

  networking.hostName = "um690slim";
}
