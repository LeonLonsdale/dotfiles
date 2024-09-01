-- ===========================================
-- General Settings
-- ===========================================

-- Set leader keys
vim.g.mapleader = " "        -- Set space as the leader key
vim.g.maplocalleader = "\\"  -- Set backslash as the local leader key

-- Enable syntax highlighting
vim.cmd("syntax on")

-- ===========================================
-- Indentation Settings
-- ===========================================

vim.cmd("set expandtab")     -- Use spaces instead of tabs
vim.cmd("set tabstop=2")     -- Number of spaces that a <Tab> counts for
vim.cmd("set softtabstop=2") -- Number of spaces that a <Tab> counts for while editing
vim.cmd("set shiftwidth=2")  -- Number of spaces used for auto-indentation

-- ===========================================
-- Appearance Settings
-- ===========================================

vim.opt.number = true             -- Enable line numbers
vim.opt.relativenumber = true     -- Enable relative line numbers
vim.opt.fillchars = { eob = " " } -- Hide tildes on empty lines
vim.opt.cursorline = true         -- Highlight the current line

-- ===========================================
-- User Interface Behavior
-- ===========================================

vim.opt.showmatch = true  -- Highlight matching parentheses
vim.opt.updatetime = 300  -- Faster completion (default is 4000ms)
vim.opt.splitbelow = true -- Horizontal splits open below the current window
vim.opt.splitright = true -- Vertical splits open to the right of the current window



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require("lazy").setup("plugins", opts)

require("config.mappings")

-- Apply custom theme
local ionz_theme_dark = require("custom.ionz_theme_dark")
for group, settings in pairs(ionz_theme_dark) do
  vim.api.nvim_set_hl(0, group, settings)
end
