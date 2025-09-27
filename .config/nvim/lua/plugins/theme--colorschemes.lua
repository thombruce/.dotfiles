return {
  -- colorscheme: tokyonight
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    -- set colorscheme at startup
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = vim.g.transparent_enabled,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
