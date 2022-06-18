-- encoding
vim.opt.fileencodings = 'utf-8,cp932,utf-16le,iso-2022-jp,euc-jp,latin1'
-- indent
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.g.softtabstop = vim.g.shiftwidth
vim.opt.expandtab = true
-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- window split
vim.opt.splitbelow = true
vim.opt.splitright = true
-- options
vim.opt.modeline = false
vim.opt.number = true
vim.opt.signcolumn = 'number'
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.laststatus = 3

-- map
vim.g.mapleader = " "

-- Common
vim.keymap.set('n', 'j',         'gj')
vim.keymap.set('n', 'k',         'gk')
vim.keymap.set('n', '<Leader>w', '<Cmd>update<CR>',                                  { silent = true })
vim.keymap.set('n', '<Leader>W', '<Cmd>write !sudo tee > /dev/null %<CR>',           { silent = true })
vim.keymap.set('n', '<Leader>d', '<Cmd>bdelete<CR>',                                 { silent = true })
vim.keymap.set('n', '<Leader>D', '<Cmd>call delete(expand("%")) <Bar> :bdelete<CR>', { silent = true })
vim.keymap.set('n', '<Leader>q', '<Cmd>qall<CR>',                                    { silent = true })
-- QuickFix
vim.keymap.set('n', '[q',        '<Cmd>cprevious<CR>',                               { silent = true })
vim.keymap.set('n', ']q',        '<Cmd>cnext<CR>',                                   { silent = true })
vim.keymap.set('n', '\\q',       '<Cmd>cclose<CR>',                                  { silent = true })
-- LocationList
vim.keymap.set('n', '[l',        '<Cmd>lprevious<CR>',                               { silent = true })
vim.keymap.set('n', ']l',        '<Cmd>lnext<CR>',                                   { silent = true })
vim.keymap.set('n', '\\l',       '<Cmd>lclose<CR>',                                  { silent = true })
