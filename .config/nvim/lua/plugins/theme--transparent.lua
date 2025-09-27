return {
  -- Transparency
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({})
    end,
  },
}
