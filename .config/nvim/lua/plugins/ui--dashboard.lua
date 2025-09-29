return {
  {
    'nvimdev/dashboard-nvim',
    enabled = true,
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            -- TODO: Add live_grep to shortcuts for current directory

            -- Apps and dotfiles were copied from suggested setup.
            -- These functions don't actually exist. Suggest that
            -- dotfiles link should open homedir dotfiles in file
            -- view or .config/nvim. Not sure what the intention
            -- of "Telescope app" would be.
            -- {
            --   desc = ' Apps',
            --   group = 'DiagnosticHint',
            --   action = 'Telescope app',
            --   key = 'a',
            -- },
            -- {
            --   desc = ' dotfiles',
            --   group = 'Number',
            --   action = 'Telescope dotfiles',
            --   key = 'd',
            -- },
          },
          project = { action = 'Oil --float ' },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
}
