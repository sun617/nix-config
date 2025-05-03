{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    cloudflared
  ];

  sops.secrets = {
    "cloudflared/cert.pem" = {
      sopsFile = ../../../secrets/user/cloudflared/cert.pem.enc;
      format = "binary";
      path = "${config.home.homeDirectory}/.cloudflared/cert.pem";
    };
  };
}
