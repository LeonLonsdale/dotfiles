return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			float = {
				padding = 20,
				max_width = 80,
				max_height = 80,
				border = "rounded",
				win_options = {
					winblend = 0,
					winhl = "Normal:OilFloatBackground,FloatBorder:OilFloatBorder",
				},
			},
			--			preview = {
			--			win_options = {
			--			winhl = "Normal:Normal, Float:Float",
			--	},
			--},
		})
	end,
}
