return {
  -- colorscheme: catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        float = {
          transparent = true,
        },
        auto_integrations = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
