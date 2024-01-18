-- Themes
return {
  {
    "navarasu/onedark.nvim",
    opts = { style = "darker" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Configure LazyVim default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
