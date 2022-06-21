require("dapui").setup()

vim.keymap.set('n', '<F12>', function() return require('dapui').toggle() end, { silent = true })
vim.keymap.set('n', 'dv', function() return require('dapui').eval() end, { silent = true })
vim.keymap.set('n', 'dx', function() return require('dapui').float_element('scopes', { enter = true }) end, { silent = true })
vim.keymap.set('n', 'dy', function() return require('dapui').float_element('watches', { enter = true }) end, { silent = true })
