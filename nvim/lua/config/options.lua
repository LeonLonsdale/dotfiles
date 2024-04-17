local cmd = vim.cmd
local opt = vim.opt

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs & Indenting
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- folds
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

---------------------------------
-- Windows, Buffers, & Appearance
---------------------------------

-- Colours
opt.termguicolors = true

-- Columns
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- Lines
opt.number = true         -- enable line numbers
opt.relativenumber = true -- enable relative line numbers
opt.wrap = false          -- disable text wrap
opt.cursorline = true     -- enable cursor line

-- window splits
opt.splitright = true -- split vertically to the right
opt.splitbelow = true -- split horizontally below

-- Hide tilde
opt.fillchars = { eob = " " }

-- Tree Appearance in Netrw
cmd("let g:netrw_liststyle = 3")

-- use system clipboard
opt.clipboard = "unnamed,unnamedplus"

-- improved completion experience
opt.completeopt = { "menuone", "noselect" }

-- maintain 8 lines above or below when scrolling.
opt.scrolloff = 8

