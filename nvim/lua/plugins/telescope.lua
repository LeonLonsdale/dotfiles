return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
    -- Configuration for Telescope can go here
    require('telescope').setup{}
  end
}
