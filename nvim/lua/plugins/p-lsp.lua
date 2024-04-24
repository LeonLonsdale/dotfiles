local servers = {
	"html",
	"emmet_ls",
	"cssls",
	"prismals",
	"tsserver",
	"eslint",
	"tailwindcss",
	"lua_ls",
	"gopls",
}

local formatters = {
	"prettierd",
	"stylua",
	"eslint_d",
}

local tools = {}

for _, server in ipairs(servers) do
	table.insert(tools, server)
end

for _, formatter in ipairs(formatters) do
	table.insert(tools, formatter)
end

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = function()
				require("mason-tool-installer").setup({
					ensure_installed = tools,
					auto_update = true,
					run_on_start = true,
					start_delay = 2000,
					debounce_hours = 12,
				})
			end,
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
