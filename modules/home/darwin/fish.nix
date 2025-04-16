{ ... }:

{
  programs.fish = {
    shellAbbrs = {
      # home-manager
      hs = "home-manager switch --flake .#mac1";
      # darwin-rebuild
      ds = "darwin-rebuild switch --flake .#mac1";
    };
    
    interactiveShellInit = ''
      eval (/opt/homebrew/bin/brew shellenv)
    '';
  };
}
