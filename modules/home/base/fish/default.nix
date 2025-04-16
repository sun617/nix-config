{
  imports = [
    ./direnv.nix
    ./eza.nix
    ./starship.nix
    ./zoxide.nix
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      # home-manager
      h = "home-manager";
    };
  };
}
