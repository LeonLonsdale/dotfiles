-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ===========================================
-- General Settings
-- ===========================================

-- Set leader keys
vim.g.mapleader = " " -- Set space as the leader key
vim.g.maplocalleader = "\\" -- Set backslash as the local leader key
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:append({ "r" })

-- Enable syntax highlighting
vim.cmd("syntax on")

-- ===========================================
-- Indentation Settings
-- ===========================================

vim.opt.autoindent = true
vim.opt.smartindent = true

-- ===========================================
-- Appearance Settings
-- ===========================================

vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.fillchars = { eob = " " } -- Hide tildes on empty lines
vim.opt.cursorline = true -- Highlight the current line

-- ===========================================
-- User Interface Behavior
-- ===========================================

vim.opt.showmatch = true -- Highlight matching parentheses
vim.opt.updatetime = 300 -- Faster completion (default is 4000ms)
vim.opt.splitbelow = true -- Horizontal splits open below the current window
vim.opt.splitright = true -- Vertical splits open to the right of the current window
