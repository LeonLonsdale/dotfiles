--return {
--	{
--		"lukas-reineke/indent-blankline.nvim",
--		event = "BufEnter",
--		opts = {
--			indent = {
--				char = "│",
--				tab_char = "│",
--			},
--			scope = { enabled = true },
--			exclude = {
--				filetypes = {
--					"help",
--					"lazy",
--					"mason",
--					"notify",
--					"oil",
--				},
--			},
--		},
--		main = "ibl",
--		config = function(_, opts)
--	local hooks = require("ibl.hooks")
--	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#303030" })
--		vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303030" })
--	end)
--			require("ibl").setup(opts)
--		end,
--	},
--}

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		opts = {
			indent = {
				char = "▏",
				tab_char = "▏",
			},
			scope = {
				enabled = true, -- Enable scope highlighting
				show_start = true, -- Option to show the start of the scope
				show_end = false, -- Option to show the end of the scope (set to true if you want it)
				highlight = "IndentBlanklineScope", -- Define the highlight group for the current scope
			},
			exclude = {
				filetypes = {
					"help",
					"lazy",
					"mason",
					"notify",
					"oil",
				},
			},
		},
		main = "ibl",
		config = function(_, opts)
			-- Highlight group configuration
			vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#E06C75", bold = true }) -- Custom color for the scope

			-- Set up ibl with the provided options
			require("ibl").setup(opts)
		end,
	},
}
