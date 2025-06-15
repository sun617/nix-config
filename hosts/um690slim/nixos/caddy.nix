{ config, ... }:

{
  services.caddy = {
    enable = true;

    virtualHosts = let
      certPath = "/var/lib/acme/qqnana.com";
    in
    {
      "immich.qqnana.com".extraConfig = ''
        reverse_proxy http://localhost:2283

        tls ${certPath}/cert.pem ${certPath}/key.pem
      '';

      "adguardhome.qqnana.com".extraConfig = ''
        reverse_proxy http://adguardhome.qqnana.com:5000

        tls ${certPath}/cert.pem ${certPath}/key.pem
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];

  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "hongri.cui+acme@gmail.com";
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      environmentFile = config.sops.secrets."cloudflare/dns-api-token".path;
    };
    certs."qqnana.com" = {
      group = config.services.caddy.group;
      domain = "*.qqnana.com";
    };
  };

  sops.secrets = {
    "cloudflare/dns-api-token" = {
      sopsFile = ../../../secrets/system/cloudflare/dns-api-token.enc;
      format = "binary";
    };
  };
}
