{
  imports = [
    ./exa.nix
    ./starship.nix
    ./zoxide.nix
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
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
