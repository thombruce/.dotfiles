return {
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false, -- NOTE: NO NEED to Lazy load

    init = function()
      --- Put your configuration here
      vim.g.neominimap = {
        auto_enable = true,

        exclude_filetypes = {
          "dashboard",
          "oil",
        },

        --- Used when `layout` is set to `float`
        float = {
          -- Explicitly set to "none" to resolve known bug:
          -- https://github.com/Isrothy/neominimap.nvim/issues/266
          window_border = "none" -- vim.fn.has("nvim-0.11") == 1 and vim.opt.winborder:get() or "single",
        },
      }
    end,
  }
}
