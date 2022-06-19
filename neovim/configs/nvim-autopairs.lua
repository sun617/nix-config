local npairs = require('nvim-autopairs')
local Rule   = require 'nvim-autopairs.rule'

npairs.setup({
  ignored_next_char = "[%w%.%']",
  fast_wrap = {},
})
npairs.add_rules {
  Rule(' ', ' ')
      :with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
      end),
}
