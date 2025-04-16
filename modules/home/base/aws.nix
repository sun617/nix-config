{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    aws-vault
    ssm-session-manager-plugin
  ];
}
