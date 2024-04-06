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

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint-lsp",
				"typescript-language-server",
				"tailwindcss-language-server",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
        auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
		config = function()
			local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
          capabilities = capabilities,
        })
			end
		end,
	},
}
