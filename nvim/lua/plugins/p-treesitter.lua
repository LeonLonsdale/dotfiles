return {
  'nvim-treesitter/nvim-treesitter',
  -- BUG: This line causes a bug
  -- event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter.configs')
    treesitter.setup({
      ensure_installed = {
        'lua',
        'typescript',
        'javascript',
        'json',
        'html',
        'css',
        'go',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
