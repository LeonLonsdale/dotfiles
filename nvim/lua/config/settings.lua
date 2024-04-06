local cmd = vim.cmd
local opt = vim.opt

-- Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true


-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- mappings
vim.g.mapleader = " "

-- Hide tilde
opt.fillchars = { eob = " " }

-- Tree Appearance in Netrw
cmd("let g:netrw_liststyle = 3")

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- window splits
opt.splitright = true -- split vertically to the right
opt.splitbelow = true -- split horizontally below
