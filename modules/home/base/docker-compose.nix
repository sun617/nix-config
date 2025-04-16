{ pkgs, ... }:

{
  home.packages = [ pkgs.docker-compose ];
  programs.fish.shellAbbrs = {
    dc = "docker compose";
    dcd = "docker compose down";
    dce = "docker compose exec";
    dcl = "docker compose logs";
    dcp = "docker compose ps";
    dcr = "docker compose run --rm";
    dcs = "docker compose stop";
    dcu = "docker compose up -d";
  };
}
