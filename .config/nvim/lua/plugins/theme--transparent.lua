return {
  -- Transparency
  {
    "xiyaowong/transparent.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("transparent").setup({})
    end,
  },
}
