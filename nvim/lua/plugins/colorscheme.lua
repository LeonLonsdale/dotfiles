return {
	{
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
	},
	--	{
	--	"shaunsingh/nord.nvim",
	--lazy = false,
	--priority = 1000,
	--config = function()
	--vim.g.nord_contrast = true
	--vim.g.nord_borders = true
	--vim.g.nord_disable_background = false
	--vim.g.nord_italic = false
	--vim.g.nord_uniform_diff_background = true
	--vim.g.nord_bold = false
	--require("nord").set()
	--end,
	--},
}
