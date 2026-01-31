return {
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          theme = 'catppuccin',
          disabled_filetypes = { 'dashboard', 'toggleterm' },
          section_separators = { left = '', right = '' },
          component_separators = { left = "╲", right = "╱" },
          ignore_focus = { 'NvimTree' },
        },
        sections = {
          lualine_x = { 'encoding', 'fileformat', { 'filetype' }, { 'lsp_status' } },
        },
        -- tabline = {
        --   lualine_a = {},
        --   lualine_b = {
        --     {
        --       'buffers',
        --       filetype_names = {
        --         oil = 'Oil',
        --         toggleterm = 'Terminal',
        --       },
        --       symbols = {
        --         alternate_file = false,
        --       },
        --     }
        --   },
        --   lualine_c = {},
        --   lualine_x = {},
        --   lualine_y = {
        --     { 'datetime', style = '%Y-%m-%d %a' },
        --   },
        --   lualine_z = {
        --     { 'datetime', style = '%H:%M' },
        --   }
        -- },
        extensions = {}
      })
    end,
  },
}
