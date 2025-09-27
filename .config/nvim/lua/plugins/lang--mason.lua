return {
  -- Mason Package Manager for LSP servers, DAP servers, linters and formatters
  {
    "mason-org/mason.nvim",
    enabled = true,
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = true,
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
