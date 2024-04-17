local builtin = require("telescope.builtin")

-- Telescope fuzzy find
pcall(require("telescope").load_extension, "fzf")

-- Grep word under cursor

local function grepWord()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end

_G.grepWord = grepWord

-- harpoon
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-------------------------
-- Which Key Categories
-------------------------

--require("which-key").register({
--	["<leader>c"] = { name = "Code Utils", _ = "which_key_ignore" },
--	["<leader>d"] = { name = "Diagnostic Tools", _ = "which_key_ignore" },
--	["<leader>f"] = { name = "Find / Search", _ = "which_key_ignore" },
--	["<leader>g"] = { name = "Git Tools", _ = "which_key_ignore" },
--	["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
--	["<leader>s"] = { name = "Splits", _ = "which_key_ignore" },
--})

local keymap = vim.keymap.set

-------------------------
-- Misc
-------------------------

keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })
keymap("n", "<leader>qq", function()
	vim.cmd("qa")
end, { desc = "Quit" })
-- File Explorer with netrw
keymap("n", "<leader>ee", function()
	vim.cmd(":Oil --float")
end, { desc = "File Explorer" })

-------------------------
-- Tab Mappings
-------------------------

keymap("n", "<leader>to", function()
	vim.cmd(":tabnew")
end, { desc = "Open new tab" })
keymap("n", "<leader>tc", function()
	vim.cmd(":tabclose")
end, { desc = "Close tab" })
keymap("n", "<leader>tn", function()
	vim.cmd(":tabnext")
end, { desc = "Next tab" })
keymap("n", "<leader>tp", function()
	vim.cmd(":tabprevious")
end, { desc = "Previous tab" })
keymap("n", "<leader>tf", function()
	vim.cmd(":tabnew %")
end, { desc = "File in new tab" })

-------------------------
-- Window Mappings
-------------------------

keymap("n", "<leader>sv", function()
	vim.cmd(":vsplit")
end, { desc = "split vertically" })
keymap("n", "<leader>sh", function()
	vim.cmd(":split")
end, { desc = "split horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equalise windows" })
keymap("n", "<leader>sc", function()
	vim.cmd(":close")
end, { desc = "Close window" })

-------------------------
-- Telescope Mappings
-------------------------

keymap("n", "<leader>ff", builtin.find_files, { desc = "Files" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
keymap("n", "<leader>fw", grepWord, { desc = "Word" })
keymap("n", "<leader>fn", function()
	vim.cmd("enew")
end, { desc = "New File" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-------------------------
-- LSP Mappings
-------------------------

keymap("n", "<leader>ch", function()
	vim.lsp.buf.hover()
end, { desc = "Hover information" })
keymap("n", "<leader>cd", function()
	vim.lsp.buf.definition()
end, { desc = "Definition" })
keymap("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Actions" })
keymap("n", "<leader>cr", function()
	vim.lsp.buf.references()
end, { desc = "References" })
-- format code
keymap("n", "<leader>cf", function()
	vim.lsp.buf.formatting()
end, { desc = "Format" })

-------------------------
-- Diagnostic Mappings
-------------------------

keymap("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Diagnostics Search" })
keymap("n", "<leader>dn", function()
	vim.diagnostic.goto_next()
end, { desc = "Next Diagnostic" })
keymap("n", "<leader>dp", function()
	vim.diagnostic.goto_prev()
end, { desc = "Previous Diagnostic" })

-------------------------
-- Git Mappings
-------------------------

keymap("n", "<leader>go", function()
	vim.cmd(":LazyGit")
end, { desc = "Lazy[G]it [O]pen" })

-------------------------
-- Harpoon Mappings
-------------------------

keymap("n", "<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "Open Harpoon Menu" })

-- Add current file to harpoon
keymap("n", "<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
keymap("n", "<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
keymap("n", "<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
keymap("n", "<leader>1", function()
	harpoon_ui.nav_file(1)
end)

keymap("n", "<leader>2", function()
	harpoon_ui.nav_file(2)
end)

keymap("n", "<leader>3", function()
	harpoon_ui.nav_file(3)
end)

keymap("n", "<leader>4", function()
	harpoon_ui.nav_file(4)
end)

keymap("n", "<leader>5", function()
	harpoon_ui.nav_file(5)
end)
