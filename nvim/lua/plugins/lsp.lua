return {
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
			local formatters = {
				prettierd = {},
				prettier = {},
				stylua = {},
			}
			local manually_installed_servers = {}
			local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))
			local ensure_installed = vim.tbl_filter(function(name)
				return not vim.tbl_contains(manually_installed_servers, name)
			end, mason_tools_to_install)

			-- Ensure the servers are installed
			require("mason-tool-installer").setup({
				auto_update = true,
				run_on_start = true,
				start_delay = 3000,
				debounce_hours = 12,
				ensure_installed = ensure_installed,
			})

			mason_lspconfig.setup_handlers({
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			-- Configure borderd for LspInfo ui
			require("lspconfig.ui.windows").default_options.border = "rounded"


			-- Configure diagnostics border
			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
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
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = false,
			default_format_opts = {
				async = true,
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			format_after_save = {
				async = true,
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				javascript = { "biome", "prettierd", "prettier" },
				typescript = { "biome", "prettierd", "prettier" },
				typescriptreact = { "biome", "prettierd", "prettier" },
				svelte = { "prettierd", "prettier " },
				lua = { "stylua" },
				go = { "gopls"}
			},
		},
	},
}
