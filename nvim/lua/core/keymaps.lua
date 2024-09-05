-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ===========================================
-- Keymaps
-- ===========================================

-- Define common keymap options
local common_opts = { noremap = true, silent = true }

-- Utility function for setting key mappings
local function map(mode, lhs, rhs, opts)
  opts = opts or {} -- Default to an empty table if no options are provided
  for k, v in pairs(common_opts) do
    if opts[k] == nil then
      opts[k] = v
    end
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Example usage of the utility function with descriptions
-- Set key mappings using the utility function
map("n", "<leader>q", ":q<CR>", { desc = "Close the current window" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })

map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "List buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Help tags" })

-- Set key mappings for Oil.nvim
map("n", "<leader>ee", ":Oil --float<CR>", { desc = "Open Oil.nvim in float mode" })
map("x", "<leader>ee", ":Oil --float<CR>", { desc = "Open Oil.nvim in float mode" })

-- Move lines up and down
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("x", "<A-Up>", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })
map("x", "<A-Down>", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })

-- Add keymap for Cmd + A to save files
-- In normal mode, <Cmd + A> will save the file
map("n", "<D-s>", ":w<CR>", { desc = "Save file" })

-- In insert mode, <Cmd + A> will exit insert mode and save the file
map("i", "<D-s>", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

-- buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Switch to the next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Switch to the previous buffer" })
map("n", "<leader>bx", ":bdelete<CR>", { desc = "Close the current buffer" })
map("n", "<leader>bd", ":%bd|e#<CR>", { desc = "Close all buffers except the current one" })

-- Setup LspAttach and LspDetach autocmds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
    map("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover info", buffer = bufnr })
    map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
    map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show references", buffer = bufnr })
    map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
    map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code", buffer = bufnr })
    map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic", buffer = bufnr })
    map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", buffer = bufnr })
    map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = bufnr })
  end,
})
vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(args)
    local bufnr = args.buf

    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>cd")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ch")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ci")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>cr")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>cn")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ca")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>cf")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>e")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "[d")
    vim.api.nvim_buf_del_keymap(bufnr, "n", "]d")
  end,
})

