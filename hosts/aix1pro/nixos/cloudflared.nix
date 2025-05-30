{ config, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "65404191-9a66-450f-91f2-aaffe497d14f" = {
        credentialsFile = config.sops.secrets."cloudflared/tunnel-credentials/65404191-9a66-450f-91f2-aaffe497d14f".path;
        default = "http_status:404";
      };
    };
  };

  sops.secrets = {
    "cloudflared/tunnel-credentials/65404191-9a66-450f-91f2-aaffe497d14f" = {
      sopsFile = ../../../secrets/system/cloudflared/tunnel-credentials/65404191-9a66-450f-91f2-aaffe497d14f.enc;
      format = "binary";
    };
  };
}
