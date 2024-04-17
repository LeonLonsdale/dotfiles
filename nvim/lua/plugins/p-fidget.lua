return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = { "BufEnter" },
	config = function()
		require("fidget").setup({})
	end,
}
