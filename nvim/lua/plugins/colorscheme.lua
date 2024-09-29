return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				-- transparent_background = true,
				flavour = "frappe",
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
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
				disable_background = true,
			})
		end,

		-- optionally set the colorscheme within lazy config
		--init = function()
		--vim.cmd("colorscheme poimandres")
		--end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})

			-- vim.cmd("colorscheme github_dark_default")
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
