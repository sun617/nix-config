# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include fonts and icons configurations
      ./fonts-and-icons.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "x1c9"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    registry = {
      nixpkgs.flake = nixpkgs;
    };
    settings = {
      substituters = [
        "https://helix.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-substituters = [
        "https://helix.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;




  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware = {
    bluetooth.enable = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sun = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel" # Enable ‘sudo’ for the user.
    ];
    packages = with pkgs; [
      git
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs = {
    fish.enable = true;
    ssh.startAgent = true;
    # sway.enable = true;
    hyprland.enable = true;
  };
  # For use swaylock in Hyprland
  # https://github.com/NixOS/nixpkgs/blob/ded926ce93dc121d245233a97855e5be0fc6a7f5/nixos/modules/programs/wayland/wayland-session.nix#L4
  security.pam.services.swaylock = {};

  # https://github.com/NixOS/nixpkgs/issues/189851#issuecomment-1238907955
  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/home/sun/.nix-profile/bin:/run/current-system/sw/bin"
  '';

  # cloudflare-warp
  # https://github.com/NixOS/nixpkgs/issues/213177#issuecomment-1905556283
  environment.systemPackages = [ pkgs.cloudflare-warp ];
  systemd.packages = [ pkgs.cloudflare-warp ];
  systemd.targets.multi-user.wants = [ "warp-svc.service" ]; # causes warp-svc to be started automatically

  # List services that you want to enable:

  services = {
    blueman.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    logind.lidSwitchDocked = "suspend";
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  virtualisation = {
    docker = {
      enable = true;
      # https://github.com/docker-library/mysql/issues/579#issuecomment-1432576518
      daemon.settings = {
        default-ulimits = {
          nofile = {
            Hard = 64000;
            Name = "nofile";
            Soft = 64000;
          };
        };
      };
    };
    libvirtd.enable = true;
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false; # Enable docker containers to access host services

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
