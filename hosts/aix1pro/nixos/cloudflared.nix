{ config, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "65404191-9a66-450f-91f2-aaffe497d14f" = {
        credentialsFile = config.sops.secrets."cloudflared/tunnel-credentials".path;
        default = "http_status:404";
      };
    };
  };

  sops.secrets = {
    "cloudflared/tunnel-credentials" = {
      sopsFile = ../../../secrets/system/cloudflared/tunnel-credentials.enc;
      format = "binary";
    };
  };
}
