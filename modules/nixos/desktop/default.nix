{ ... }:

{
  imports = [
    ../base
    ./fonts-and-icons.nix
    ./gnome-keyring.nix
  ];

  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
    # https://github.com/clash-verge-rev/clash-verge-rev/issues/3428
    # clash-verge.enable = true;
  };

  # List services that you want to enable:
  services = {
    blueman.enable = true;
    flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
  };
}
