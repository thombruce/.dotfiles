vim.pack.add({
  'https://github.com/Isrothy/neominimap.nvim',
})

vim.g.neominimap = {
  auto_enable = true,

  exclude_filetypes = {
    "",
    "oil",
    -- "markdown",
    -- "telekasten",
    -- "fountain",
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

vim.keymap.set("n", "<leader>sm", "<cmd>Neominimap Toggle<cr>", { desc = "Toggle Minimap" })
vim.keymap.set("n", "<C-=>", "<cmd>Neominimap ToggleFocus<cr>", { desc = "Switch focus on minimap" })
