require 'hop'.setup {}

vim.keymap.set('n', 'gw', function() return require 'hop'.hint_words() end)
vim.keymap.set('n', 'gl', function() return require 'hop'.hint_lines() end)
vim.keymap.set('n', 'f', function() return require 'hop'.hint_char1({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR }) end)
vim.keymap.set('n', 'F', function() return require 'hop'.hint_char1({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR }) end)
