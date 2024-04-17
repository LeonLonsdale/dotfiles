return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = true,
        gitsigns = true,
        harpoon = true,
        illuminate = true,
        indent_blanklinke = {
          enabled = false,
          scope_color = "sapphire",
          colored_indent_levels = false,
        },
        mason = true,
        native_lsp = { enabled = true },
        notify = true,
        nvimtree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
