return {
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "hrsh7th/nvim-cmp",
      "saghen/blink.cmp",
    },
    config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          -- NOTE: This has some conflicts with the completion menu provided by Blink
          --       See ./lang--blink.lua for a workaround
        }
      })
    end
  },
}
