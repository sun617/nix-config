{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "solarized_dark";
      editor.indent-guides = {
        render = true;
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":qa";
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
            serverPath = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib/tsserverlibrary.js";
          };
        };
      }
    ];  
  };
}
