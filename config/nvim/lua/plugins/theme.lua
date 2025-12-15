local theme = "tokyonight-night"
-- local theme = "night-owl"

return {
  {
    "haishanh/night-owl.vim",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = theme,
    },
  },
}
