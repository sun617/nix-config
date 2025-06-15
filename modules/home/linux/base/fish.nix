{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      # docker
      d = "docker";
      di = "docker image";
      de = "docker exec -it";
      dp = "docker ps";
      dr = "docker run --rm -it";
      dv = "docker volume";
      # flatpak
      f = "flatpak";
      fi = "flatpak install --user flathub";
      fs = "flatpak search";
      fu = "flatpak update";
      # systemctl
      s = "systemctl";
      su = "systemctl --user";
      sus = "systemctl --user status";
      # journalctl
      j = "journalctl";
      ju = "journalctl --user";
    };
  };
}
