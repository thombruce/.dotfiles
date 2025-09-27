return {
  -- GitSigns
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    event = "BufReadPre",

    config = function()
      require("gitsigns").setup({})
    end,
  },
}
