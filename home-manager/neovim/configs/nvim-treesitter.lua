require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = "@function.outer",
        ['if'] = "@function.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']f'] = "@function.outer",
        [']a'] = "@parameter.inner",
      },
      goto_previous_start = {
        ['[f'] = "@function.outer",
        ['[a'] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['gm'] = "@function.outer",
        ['gc'] = "@class.outer",
      },
    },
  },
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
