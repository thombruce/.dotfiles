return {
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false, -- NOTE: NO NEED to Lazy load

    keys = {
      -- Global Minimap Controls
      { "<leader>sm", "<cmd>Neominimap Toggle<cr>",      desc = "Toggle Minimap" },

      ---Focus Controls
      { "<C-=>",      "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
    },

    init = function()
      --- Put your configuration here
      vim.g.neominimap = {
        auto_enable = true,

        exclude_filetypes = {
          "dashboard",
          "oil",
          "markdown",
          "telekasten",
          "fountain",
        },

        --- Used when `layout` is set to `float`
        float = {
          -- Explicitly set to "none" to resolve known bug:
          -- https://github.com/Isrothy/neominimap.nvim/issues/266
          window_border = "none" -- vim.fn.has("nvim-0.11") == 1 and vim.opt.winborder:get() or "single",
        },

        click = {
          -- Enable mouse click on the minimap
          enabled = true,
          -- Automatically switch focus to the minimap when clicked
          auto_switch_focus = false,
        },
      }
    end,
  }
}
