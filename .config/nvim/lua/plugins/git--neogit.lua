return {
  -- NeoGit
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("neogit").setup({
        kind = "floating",
        integrations = {
          telescope = true,
          diffview = true,
        },
        mappings = {
          commit_editor = {
            ["<Esc>"] = "Close",
          },
          rebase_editor = {
            ["<Esc>"] = "Close",
          },
          status = {
            ["<Esc>"] = "Close",
          },
        }
      })
    end,
  },
}
