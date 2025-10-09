return {
  "00msjr/nvim-fountain",
  enabled = true,
  ft = "fountain", -- Lazy-load only for fountain files
  config = function()
    require("nvim-fountain").setup({
      -- Optional configuration
      keymaps = {
        next_scene = "]]",
        prev_scene = "[[",
        uppercase_line = "<S-CR>",
      },
      -- Export configuration
      export = {
        pdf = { options = "--overwrite --font Courier" },
      },
      -- Enable treesitter integration if available
      use_treesitter = true,
    })
  end,
}
