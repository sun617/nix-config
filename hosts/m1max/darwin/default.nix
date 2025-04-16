{ pkgs, ... }:

{
  imports = [
    ../../../modules/darwin
  ];

  users.users."h.cui" = {
    home = "/Users/h.cui";
    shell = pkgs.fish;
  };
}
