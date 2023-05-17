{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: {
      src = (builtins.fetchTarball {
        url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
        sha256 = "0nb7iavknf4rpdc7fi54x0hnhp4acgfb4yrf0xl4h5h599y651q3";
      });
      version = "latest";
    });
  };
}
