{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = "lua << EOF\n${builtins.readFile ./configs/init.lua}\nEOF";
    extraPackages = with pkgs; [
      gopls
      nodePackages.typescript-language-server
      nodePackages.vls
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      rnix-lsp
      rust-analyzer
      sumneko-lua-language-server
    ];
    plugins = with pkgs.vimPlugins; [
      {
        type = "lua";
        plugin = fzf-lua;
        config = builtins.readFile ./configs/fzf-lua.lua;
      }
      {
        type = "lua";
        plugin = nightfox-nvim;
        config = builtins.readFile ./configs/nightfox-nvim.lua;
      }
      {
        type = "lua";
        plugin = nvim-treesitter.withPlugins (p: with p; [
          tree-sitter-bash
          tree-sitter-comment
          tree-sitter-css
          tree-sitter-dockerfile
          tree-sitter-fish
          tree-sitter-go
          tree-sitter-gomod
          tree-sitter-graphql
          tree-sitter-html
          tree-sitter-java
          tree-sitter-javascript
          tree-sitter-json
          tree-sitter-lua
          tree-sitter-nix
          tree-sitter-python
          tree-sitter-regex
          tree-sitter-ruby
          tree-sitter-rust
          tree-sitter-scss
          tree-sitter-toml
          tree-sitter-typescript
          tree-sitter-vue
          tree-sitter-yaml
        ]);
        config = builtins.readFile ./configs/nvim-treesitter.lua;
      }
      {
        type = "lua";
        plugin = neogit;
        config = builtins.readFile ./configs/neogit.lua;
      }
    ];
  };
}
