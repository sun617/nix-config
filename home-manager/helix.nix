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
    languages = {
      language-server.vue-language-server = {
        command = "npx";
        args = [
          "--package"
          "@vue/language-server"
          "vue-language-server"
          "--stdio"
        ];
        config.typescript.tsdk = "node_modules/typescript/lib/";
      };
      # https://github.com/helix-editor/helix/pull/2507#issuecomment-1485261780
      language-server.eslint = {
        command = "vscode-eslint-language-server";
        args = [
          "--stdio"
        ];
        config = {
          validate = "on";
          experimental = {
            useFlatConfig = false;
          };
          rulesCustomizations = [];
          run = "onType";
          problems = {
            shortenToSingleLine = false;
          };
          nodePath = "";
          codeAction = {
            disableRuleComment = {
              enable = true;
              location = "sameLine";
            };
            showDocumentation = {
              enable = true;
            };
          };
        };
      };
      language = [
        {
          name = "typescript";
          auto-format = true;
          # formatter = {
          #   command = "prettier";
          #   args = [
          #     "--parser"
          #     "typescript"
          #   ];
          # };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [
                "format"
              ];
            }
            "eslint"
          ];
        }
        {
          name = "vue";
          auto-format = true;
          language-servers = [
            {
              # name = "vuels";
              name = "vue-language-server";
              except-features = [
                "format"
              ];
            }
            "eslint"
          ];
        }
      ];
    };
  };
}
