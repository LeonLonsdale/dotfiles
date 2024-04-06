local builtin = require('telescope.builtin')

-- Telescope fuzzy find
pcall(require('telescope').load_extension, 'fzf')

-- Grep word under cursor

local function grepWord()
  builtin.grep_string({ search = vim.fn.expand('<cword>') })
end

_G.grepWord = grepWord


-------------------------
-- Which Key Categories
-------------------------

require('which-key').register({
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
})

local keymap = vim.keymap.set

-------------------------
-- Misc
-------------------------

keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Smart [R]e[n]ame" })
keymap('n', '<leader>qq', function() vim.cmd('qa') end, { desc = "[Q]uit" })
-- File Explorer with netrw
keymap('n', '<leader>ee', function() vim.cmd('Explore') end, { desc = "File [E]xplorer" })

-------------------------
-- Tab Mappings
-------------------------

keymap('n', '<leader>to', function() vim.cmd(':tabnew') end, { desc = "[O]pen new tab" })
keymap('n', '<leader>tc', function() vim.cmd(':tabclose') end, { desc = "[C]lose tab" })
keymap('n', '<leader>tn', function() vim.cmd(':tabnext') end, { desc = "[N]ext tab" })
keymap('n', '<leader>tp', function() vim.cmd(':tabprevious') end, { desc = "[P]revious tab" })
keymap('n', '<leader>tf', function() vim.cmd(':tabnew %') end, { desc = "[F]ile in new tab" })

-------------------------
-- Window Mappings
-------------------------

keymap('n', '<leader>sv', function() vim.cmd(':vsplit') end, { desc = "[s]plit [v]ertically" })
keymap('n', '<leader>sh', function() vim.cmd(':split') end, { desc = "[s]plit [h]orizontally" })
keymap('n', '<leader>se', "<C-w>=", { desc = "[E]qualise windows" })
keymap('n', '<leader>sc', function() vim.cmd(':close') end, { desc = "[C]lose window" })

-------------------------
-- Telescope Mappings
-------------------------

keymap('n', '<leader>ff', builtin.find_files, { desc = "[F]iles" })
keymap('n', '<leader>fh', builtin.help_tags, { desc = "[H]elp" })
keymap('n', '<leader>fg', builtin.live_grep, { desc = "[G]rep" })
keymap('n', '<leader>fr', builtin.oldfiles, { desc = "[R]ecent files" })
keymap('n', '<leader>fw', grepWord, { desc = "[W]ord" })
keymap('n', '<leader>fn', function() vim.cmd('enew') end, { desc = "[N]ew File" })
keymap('n', '<leader>fb', builtin.buffers, { desc = "[B]uffers" })
keymap('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = "Find todos" })

-------------------------
-- Neo Tree Mappings
-------------------------

--vim.keymap.set('n', '<C-n>', function() vim.cmd(':Neotree toggle') end, { desc = "Toggle [N]eo Tree" })
--vim.keymap.set('n', '<C-f>', function() vim.cmd(':Neotree focus') end, { desc = "[F]ocus Neo Tree" })

-------------------------
-- Nvim Tree Mappings
-------------------------

-- vim.keymap.set('n', '<C-n>', function() vim.cmd(':NvimTreeToggle') end, { desc = "Toggle [N]vim Tree" })
-- vim.keymap.set('n', '<C-f>', function() vim.cmd(':NvimTreeFocus') end, { desc = "[F]ocus Nvim Tree" })

-------------------------
-- LSP Mappings
-------------------------

keymap('n', '<leader>ch', function() vim.lsp.buf.hover() end, { desc = "[H]over information" })
keymap('n', '<leader>cd', function() vim.lsp.buf.definition() end, { desc = "[D]efinition" })
keymap('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = "[A]ctions" })
keymap('n', '<leader>cr', function() vim.lsp.buf.references() end, { desc = "[R]eferences" })
-- format code
keymap('n', '<leader>cf', function() vim.lsp.buf.formatting() end, { desc = "[F]ormat" })

-------------------------
-- Diagnostic Mappings
-------------------------

keymap('n', '<leader>dd', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = "[D]iagnostics" })
keymap('n', '<leader>dn', function() vim.diagnostic.goto_next() end, { desc = "[N]ext Diagnostic" })
keymap('n', '<leader>dp', function() vim.diagnostic.goto_prev() end, { desc = "[P]revious Diagnostic" })

-------------------------
-- Git Mappings
-------------------------

keymap('n', '<leader>go', function() vim.cmd(':LazyGit') end, { desc = "Lazy[G]it [O]pen" })
