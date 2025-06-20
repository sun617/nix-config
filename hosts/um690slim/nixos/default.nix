{ ... }:

{
  imports = [
    ../../../modules/nixos/server
    ./hardware-configuration.nix
    ./adguardhome.nix
    ./caddy.nix
    ./cloudflared.nix
    ./restic.nix
    ./tailscale.nix
  ];

  networking.hostName = "um690slim";
}
