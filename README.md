```
# remove system generations
sudo nix-collect-garbage --delete-old
sudo nixos-rebuild switch --flake .

# remove home-manager generations
home-manager expire-generations '-1 day'
nix store gc --verbose # or nix-collect-garbase --delete-old

# update
nix flake update
sudo nixos-rebuild switch --flake .
home-manager switch --flake .

# update helix
nix flake lock --update-input helix
```
