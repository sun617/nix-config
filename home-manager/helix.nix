{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "solarized_dark";
      editor = {
        cursorline = true;
        true-color = true;
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
        };
        soft-wrap = {
          enable = true;
        };
      };
      keys.normal = {
        space.c = ":buffer-close";
        space.i = ":toggle-option lsp.display-inlay-hints";
        space.q = ":write-quit-all";
        space.w = ":write-all";
      };
    };
    languages = [
      {
        name = "vue";
        language-server = {
          command = "npx";
          args = [
            "--package"
            "@volar/vue-language-server"
            "vue-language-server"
            "--stdio"
          ];
        };
        config = {
          typescript = {
            tsdk = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib";
          };
        };
      }
    ];
  };
}
