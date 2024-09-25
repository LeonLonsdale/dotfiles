return {
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
    -- format_after_save = true, -- Apply formatting after save
    formatters_by_ft = {
      javascript = { "biome", "prettierd" },
      typescript = { "biome", "prettierd" },
      typescriptreact = { "biome", "prettierd" },
      svelte = { "prettierd" },
      lua = { "stylua" },
      go = { "gopls" },
    },
  },
}
