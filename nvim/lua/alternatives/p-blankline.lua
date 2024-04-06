return {
    "lukas-reineke/indent-blankline.nvim",
  event = {"BufRead", "BufNewFile"},
  main = "ibl",
  opts = {},
    config = function()
        require("ibl").setup({
          indent = {
            char = "▏",
          }
        })
  end
}
