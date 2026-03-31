vim.pack.add({
  -- THEME
  'https://github.com/catppuccin/nvim',
  -- UI
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})

require('catppuccin').setup({
    transparent_background = true,
    float = {
        transparent = true,
    },
    auto_integrations = true,
})

vim.cmd.colorscheme("catppuccin-nvim")

require('noice').setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    presets = {
        lsp_doc_border = true,
    }
})

require("lualine").setup({
    options = {
        theme = 'catppuccin-nvim',
        disabled_filetypes = { '', 'oil' },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        ignore_focus = { 'NvimTree' },
    },
    sections = {
        lualine_x = { 'encoding', 'fileformat', { 'filetype' }, { 'lsp_status' } },
    },
    tabline = {
      lualine_a = {},
      lualine_b = {
        {
          'buffers',
          filetype_names = {
            oil = 'Oil',
          },
          symbols = {
            alternate_file = false,
          },
        }
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        { 'datetime', style = '%Y-%m-%d %a' },
      },
      lualine_z = {
        { 'datetime', style = '%H:%M' },
      }
    },
    extensions = {}
})
