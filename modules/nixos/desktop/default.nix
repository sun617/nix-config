{ ... }:

{
  imports = [
    ../base
    ./fonts-and-icons.nix
    ./gnome-keyring.nix
    ./rustdesk.nix
    ./tailscale.nix
  ];

  programs = {
    clash-verge.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    localsend.enable = true;
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
