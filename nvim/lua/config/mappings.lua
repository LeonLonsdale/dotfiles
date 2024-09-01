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
