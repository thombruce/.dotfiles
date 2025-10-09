-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#h-j-k-l-style-navigation-and-editing

-- Disable the default netrw file explorer
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

local api                = require("nvim-tree.api")

-- START h,j,k,l keys for tree navigation
local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

-- global
vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
-- TODO: Prefer that this NvimTreeFocus if the tree is already open.

-- on_attach
local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- on_attach
  vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
  -- vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close, opts("Close"))
  vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
})
