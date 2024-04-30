{ pkgs, ... }:

{
  home.packages = [ pkgs.docker-compose ];
  programs.fish.shellAbbrs = {
    dc = "docker compose";
    dcb = "docker compose build";
    dcd = "docker compose down";
    dce = "docker compose exec";
    dcl = "docker compose logs";
    dcp = "docker compose ps";
    dcr = "docker compose restart";
    dcR = "docker compose run --rm";
    dcs = "docker compose start";
    dcS = "docker compose stop";
    dct = "docker compose top";
    dcu = "docker compose up -d";
    dcv = "docker compose version";
  };
}
