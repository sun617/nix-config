{
  imports = [
    ./direnv.nix
    ./exa.nix
    ./starship.nix
    ./zoxide.nix
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      # docker
      d = "docker";
      da = "docker attach";
      dC = "docker container";
      di = "docker image";
      dv = "docker volume";
      dr = "docker run --rm -it";
      # flatpak
      f = "flatpak";
      fi = "flatpak info";
      fip = "flatpak info --show-permissions";
      fI = "flatpak install flathub";
      fl = "flatpak list";
      fo = "flatpak override";
      fs = "flatpak search";
      fu = "flatpak update";
      fU = "flatpak uninstall";
      # home-manager
      h = "home-manager";
      hs = "home-manager switch --flake .";
      # nixos-rebuild
      ns = "sudo nixos-rebuild switch --flake .";
      # systemctl
      s = "systemctl";
      sc = "systemctl cat";
      se = "systemctl enable";
      sl = "systemctl list-dependencies";
      ss = "systemctl status";
      su = "systemctl --user";
      suc = "systemctl --user cat";
      sue = "systemctl --user enable";
      sul = "systemctl --user list-dependencies";
      sus = "systemctl --user status";
    };
  };
}
