-- Map <leader>q to :q to close the current window
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- Map <leader>e to open Oil.nvim
-- Set up key mapping to open Oil.nvim in float mode in Normal and Visual modes
vim.keymap.set('n', '<leader>ee', ':Oil --float<CR>', {})
vim.keymap.set('x', '<leader>ee', ':Oil --float<CR>', {})


