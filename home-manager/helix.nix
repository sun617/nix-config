{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "solarized_dark";
      editor = {
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        idle-timeout = 0;
        indent-guides = {
          render = true;
        };
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":qa";
      };
    };
    languages = [
      {
        name = "nix";
        auto-format = true;
      }
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
          timeout = 9;
        };
        config = {
          documentFeatures = {
            documentColor = false;
            documentFormatting = {
              defaultPrintWidth = 100;
            };
            documentSymbol = true;
            foldingRange = true;
            linkedEditingRange = true;
            selectionRange = true;
          };
          languageFeatures = {
            callHierarchy = true;
            codeAction = true;
            codeLens = true;
            completion = {
              defaultAttrNameCase = "kebabCase";
              defaultTagNameCase = "both";
            };
            definition = true;
            diagnostics = true;
            documentHighlight = true;
            documentLink = true;
            hover = true;
            implementation = true;
            references = true;
            rename = true;
            renameFileRefactoring = true;
            schemaRequestService = true;
            semanticTokens = false;
            signatureHelp = true;
            typeDefinition = true;
          };
          typescript = {
            tsdk = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib";
          };
        };
      }
    ];
  };
}
