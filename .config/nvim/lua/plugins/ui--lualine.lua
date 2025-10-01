return {
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Custom function to add margin when NvimTree is open
      -- see:  https://github.com/nvim-lualine/lualine.nvim/issues/671#issuecomment-1145583452
      local nvim_tree_shift = {
        function()
          return string.rep(' ',
            vim.api.nvim_win_get_width(require 'nvim-tree.view'.get_winnr()) - 1)
        end,
        cond = require('nvim-tree.view').is_visible,
        color = 'NvimTreeNormal'
      }

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
        tabline = {
          lualine_a = {
            -- Custom function (see above)
            nvim_tree_shift,
            {
              'buffers',
              filetype_names = {
                oil = 'Oil',
                toggleterm = 'Terminal',
              },
              symbols = {
                alternate_file = false,
              },
            }
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            { 'datetime', style = '%Y-%m-%d %a' },
          },
          lualine_z = {
            { 'datetime', style = '%H:%M' },
          }
        },
        extensions = { 'nvim-tree' }
      })
    end,
  },
}
