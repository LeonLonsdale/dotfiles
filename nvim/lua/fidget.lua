return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = { "BufEnter" },
	config = function()
		-- Turn on LSP, formatting, and linting status and progress information
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
					border = "rounded",
				},
			},
		})
	end,
}
