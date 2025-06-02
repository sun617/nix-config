{ config, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "eda29dab-97e7-488f-b4a5-e3e6bc9ae58b" = {
        credentialsFile = config.sops.secrets."cloudflared/tunnel-credentials/eda29dab-97e7-488f-b4a5-e3e6bc9ae58b".path;
        default = "http_status:404";
      };
    };
  };

  sops.secrets = {
    "cloudflared/tunnel-credentials/eda29dab-97e7-488f-b4a5-e3e6bc9ae58b" = {
      sopsFile = ../../../secrets/system/cloudflared/tunnel-credentials/eda29dab-97e7-488f-b4a5-e3e6bc9ae58b.enc;
      format = "binary";
    };
  };
}
