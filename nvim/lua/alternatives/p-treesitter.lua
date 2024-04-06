return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufRead', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local configs = require('nvim-treesitter.configs')
    configs.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      sync_install = {
        enable = true,
      },
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'tsx',
        'go',
        'prisma',
        'markdown',
        'markdown_inline',
        'vim',
        'gitignore',
        'yaml',
        'json',
        'html',
        'css',
        'scss',
        'toml'
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    })
  end,
}
