{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    extraConfig = "lua << EOF\n${builtins.readFile ./configs/init.lua}\nEOF\n\n";
    plugins = with pkgs.vimPlugins; [
      # lsp
      {
        type = "lua";
        plugin = nvim-lspconfig;
        config = builtins.readFile ./configs/nvim-lspconfig.lua;
      }
      {
        type = "lua";
        plugin = nvim-cmp;
        config = builtins.readFile ./configs/nvim-cmp.lua;
      }
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-buffer
      {
        type = "lua";
        plugin = luasnip;
        config = builtins.readFile ./configs/luasnip.lua;
      }
      cmp_luasnip
      friendly-snippets

      # dap
      {
        type = "lua";
        plugin = nvim-dap;
        config = builtins.readFile ./configs/nvim-dap.lua;
      }
      {
        type = "lua";
        plugin = nvim-dap-ui;
        config = builtins.readFile ./configs/nvim-dap-ui.lua;
      }

      # fzf-lua
      {
        type = "lua";
        plugin = fzf-lua;
        config = builtins.readFile ./configs/fzf-lua.lua;
      }
      {
        plugin = nvim-web-devicons;
        optional = true;
      }

      # nvim-tree
      {
        type = "lua";
        plugin = nvim-tree-lua;
        config = builtins.readFile ./configs/nvim-tree-lua.lua;
      }

      # Navigator
      {
        type = "lua";
        plugin = Navigator-nvim;
        config = builtins.readFile ./configs/Navigator-nvim.lua;
      }

      # treesitter
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
      nvim-treesitter-textobjects

      # nvim-autopairs
      {
        type = "lua";
        plugin = nvim-autopairs;
        config = builtins.readFile ./configs/nvim-autopairs.lua;
      }

      # surround
      {
        type = "lua";
        plugin = surround-nvim;
        config = builtins.readFile ./configs/surround-nvim.lua;
      }

      # hop
      {
        type = "lua";
        plugin = hop-nvim;
        config = builtins.readFile ./configs/hop-nvim.lua;
      }

      # indent-blankline
      {
        type = "lua";
        plugin = indent-blankline-nvim;
        config = builtins.readFile ./configs/indent-blankline-nvim.lua;
      }

      # Comment.nvim
      {
        type = "lua";
        plugin = comment-nvim;
        config = builtins.readFile ./configs/comment-nvim.lua;
      }
      nvim-ts-context-commentstring

      # gitsigns
      {
        type = "lua";
        plugin = gitsigns-nvim;
        config = builtins.readFile ./configs/gitsigns-nvim.lua;
      }
      plenary-nvim

      # neogit
      {
        type = "lua";
        plugin = neogit;
        config = builtins.readFile ./configs/neogit.lua;
      }

      # nightfox
      {
        type = "lua";
        plugin = nightfox-nvim;
        config = builtins.readFile ./configs/nightfox-nvim.lua;
      }

      # feline
      {
        type = "lua";
        plugin = feline-nvim;
        config = builtins.readFile ./configs/feline-nvim.lua;
      }

      # colorizer
      {
        type = "lua";
        plugin = nvim-colorizer-lua;
        config = builtins.readFile ./configs/nvim-colorizer-lua.lua;
      }
    ];
  };
}
