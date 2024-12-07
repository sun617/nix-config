# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }:

{
  imports =
    [
      ../nix
      ./fonts-and-icons.nix
    ];

  nix.gc = {
    dates = "22:00";
    randomizedDelaySec = "10min";
    persistent = true;
  };
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

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
    graphics = {
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
    hyprland.enable = true;
    hyprlock.enable = true;
    clash-verge = {
      enable = true;
      package = pkgs.clash-verge-rev;
      # package = pkgs.clash-nyanpasu;
      tunMode = true;
    };
  };
  # https://github.com/NixOS/nixpkgs/pull/344659/files
  systemd.services.clash-verge = {
    enable = true;
    description = "Clash Verge Service Mode";
    serviceConfig = {
      ExecStart = "${pkgs.clash-verge-rev}/bin/clash-verge-service";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
  };

  # List services that you want to enable:
  services = {
    blueman.enable = true;
    cloudflare-warp.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    logind.lidSwitchDocked = "suspend";
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    rustdesk-server = {
      enable = true;
      openFirewall = true;
      signal.relayHosts = [
        "relay.rustdesk.local"
      ];
    };
    # samba = {
    #   enable = true;
    #   openFirewall = true;
    #   shares = {
    #     private = {
    #       path = "/home/sun/workspace/share";
    #       "read only" = false;
    #       browseable = "yes";
    #       "guest ok" = "no";
    #     };
    #   };
    # };
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
  # networking.firewall.enable = false;

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
  system.stateVersion = "24.05"; # Did you read the comment?
}
