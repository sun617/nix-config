{ pkgs, ... }:

{
  imports = [
    ../nix
  ];
  nix.gc.interval = {
    Hour = 12;
    Minute = 0;
  };

  # Add to /etc/shells
  environment.shells = [
    pkgs.fish 
  ];
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    # pkgs.vim
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  homebrew = {
    enable = true;
    casks = [
      "arc"
      "bruno"
      "cursor"
      "dbeaver-community"
      "docker"
      "google-japanese-ime"
      "obsidian"
      "rectangle"
      "spacedrive"
      "stats"
      "warp"
      "zed"
    ];
    masApps = {
      Manico = 724472954;
    };
  };

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "right";
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.swipescrolldirection" = false;
    };
  };
}
