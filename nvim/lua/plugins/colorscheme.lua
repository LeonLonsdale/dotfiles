return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			flavour = "macchiato",
			integrations = {
				cmp = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				indent_blankline = {
					enabled = false,
					scope_color = "sapphire",
					colored_indent_levels = false,
				},
				mason = true,
				native_lsp = { enabled = true },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
