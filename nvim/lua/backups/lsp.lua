return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"html",
					"tailwindcss",
					"cssls",
					"tsserver",
					"prismals",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPost" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local servers = {
				"lua_ls",
				"gopls",
				"html",
				"tailwindcss",
				"cssls",
				"tsserver",
				"prismals",
			}
			-- Ensure the servers are installed
			mason_lspconfig.setup_handlers({
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- Setup LspAttach and LspDetach autocmds
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local opts = { noremap = true, silent = true, buffer = bufnr }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				callback = function(args)
					local bufnr = args.buf
					vim.api.nvim_buf_del_keymap(bufnr, "n", "gd")
					vim.api.nvim_buf_del_keymap(bufnr, "n", "K")
					-- Remove other key mappings as needed
				end,
			})
		end,
	},
}
