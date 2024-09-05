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
			local tsserver_inlay_hints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			}
			local servers = {
				lua_ls = {},
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
							usePlaceholders = true,
							completeUnimported = true,
						},
					},
				},
				gofumpt = {},
				html = {},
				tailwindcss = {},
				cssls = {},
				tsserver = {},
				prismals = {},
			}

			local formatters = {
				biome = {},
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
				function(server_name)
					local config = servers[server_name] or {}
					server_name = server_name == "tsserver" and "ts_ls" or server_name
					config.capabilities = capabilities -- Add LSP capabilities
					lspconfig[server_name].setup(config)
				end,
			})

			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			mason_lspconfig.setup({
				ensure_installed = servers,
			})

			-- Configure borders for LSP floating windows
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			-- Configure borders for LspInfo UI
			require("lspconfig.ui.windows").default_options.border = "rounded"

			-- Configure diagnostics borders
			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
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
			format_after_save = true, -- Apply formatting after save
			formatters_by_ft = {
				javascript = { "biome", "prettierd", "prettier" },
				typescript = { "biome", "prettierd", "prettier" },
				typescriptreact = { "biome", "prettierd", "prettier" },
				svelte = { "prettierd", "prettier" },
				lua = { "stylua" },
				go = { "gopls" },
			},
		},
	},
}
