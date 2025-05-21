{ ... }:

{
  imports = [
    ../../../modules/nixos
    ./hardware-configuration.nix
    ./cloudflared.nix
    ./dnsmasq.nix
    ./nginx.nix
    ./tailscale.nix
  ];

  networking.hostName = "aix1pro";
}
