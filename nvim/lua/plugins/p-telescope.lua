return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-tree/nvim-web-devicons',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'folke/todo-comments.nvim',

    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
