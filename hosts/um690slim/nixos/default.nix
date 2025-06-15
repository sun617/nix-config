{ ... }:

{
  imports = [
    ../../../modules/nixos/server
    ./hardware-configuration.nix
    ./adguardhome.nix
    ./caddy.nix
    ./cloudflared.nix
    ./tailscale.nix
  ];

  networking.hostName = "um690slim";
}
