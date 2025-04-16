{
  nix.gc = {
    automatic = true;
    frequency = "21:00";
    randomizedDelaySec = "10min";
    options = "--delete-older-than 1d";
    persistent = true;
  };
}
