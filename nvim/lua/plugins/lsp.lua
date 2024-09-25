return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local default_handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    local servers = {
      biome = {},
    }

    local formatters = {
      biome = {},
      prettierd = {},
    }

    local manually_installed_servers = {}
    local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))
    local ensure_installed = vim.tbl_filter(function(name)
      return not vim.tbl_contains(manually_installed_servers, name)
    end, mason_tools_to_install)

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
        config.handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {})
        lspconfig[server_name].setup(config)
      end,
    })

    mason_lspconfig.setup({
      ensure_installed = servers,
    })
  end,
}
