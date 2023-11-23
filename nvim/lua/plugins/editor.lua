return {
  -- https://github.com/alexghergh/nvim-tmux-navigation
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
      })
    end,
  },
}
