return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        ensure_installed = {},
        highlight = {
          enable = true
        },
      }
    end,
  },
}
