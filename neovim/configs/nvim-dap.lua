-- https://github.com/go-delve/delve/issues/2328
-- https://github.com/golang/vscode-go/blob/master/docs/debugging.md#connecting-to-headless-delve-with-target-specified-at-server-start-up
require('dap.ext.vscode').load_launchjs()
-- mapping
vim.keymap.set('n', '<F8>', function() return require('dap').continue() end, { silent = true })
vim.keymap.set('n', '<F10>', function() return require('dap').step_over() end, { silent = true })
vim.keymap.set('n', '<F11>', function() return require('dap').step_into() end, { silent = true })
vim.keymap.set('n', '<F9>', function() return require('dap').step_out() end, { silent = true })
vim.keymap.set('n', '<Leader>b', function() return require('dap').toggle_breakpoint() end, { silent = true })

local dap = require('dap')
-- go
dap.adapters.go = {
  type = 'server',
  host = '127.0.0.1',
  port = 2345
}
