require 'fzf-lua'.setup {
  fzf_bin = 'sk'
}

vim.keymap.set('n', '<Leader>f', function() return require('fzf-lua').files() end, { silent = true })
vim.keymap.set('n', '<Leader><Leader>', function() return require('fzf-lua').buffers() end, { silent = true })
vim.keymap.set('n', '<Leader>/', function() return require('fzf-lua').live_grep() end, { silent = true })
vim.keymap.set('n', '<Leader>/w', function() return require('fzf-lua').grep_cword() end, { silent = true })
vim.keymap.set('n', '<Leader>ca', function() return require('fzf-lua').lsp_code_actions() end, { silent = true })
vim.keymap.set('n', 'gD', function() return require('fzf-lua').lsp_declarations({ jump_to_single_result = true }) end, { silent = true })
vim.keymap.set('n', 'gd', function() return require('fzf-lua').lsp_definitions({ jump_to_single_result = true }) end, { silent = true })
vim.keymap.set('n', 'ge', function() return require('fzf-lua').lsp_workspace_diagnostics() end, { silent = true })
vim.keymap.set('n', 'gi', function() return require('fzf-lua').lsp_implementations({ jump_to_single_result = true }) end, { silent = true })
vim.keymap.set('n', 'gr', function() return require('fzf-lua').lsp_references({ jump_to_single_result = true }) end, { silent = true })
vim.keymap.set('n', 'gs', function() return require('fzf-lua').lsp_document_symbols() end, { silent = true })
vim.keymap.set('n', 'gt', function() return require('fzf-lua').lsp_typedefs({ jump_to_single_result = true }) end, { silent = true })
