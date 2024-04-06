return {
  'folke/todo-comments.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- TODO: this is a todo
  -- HACK: this is a hack
  -- BUG: t his is a bug
  --
  -- FIXME: this is a fixme
  -- BUG: this is also a bug

  config = function()
    local todo_comments = require('todo-comments')

    local keymap = vim.keymap.set

    keymap('n', ']t', function() todo_comments.jump_next() end, { desc = 'Next todo comment' })
    keymap('n', '[t', function() todo_comments.jump_prev() end, { desc = 'Previous todo comment' })

    todo_comments.setup()
  end,
}
