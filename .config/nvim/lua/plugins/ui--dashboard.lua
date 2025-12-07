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
              icon = ' ',
              desc = 'Files',
              icon_hl = 'Label',
              group = 'Label',
              action = 'Yazi', -- 'Telescope find_files cwd=', -- 'Oil --float ',
              key = '-',
            },
            -- TODO: Add live_grep to shortcuts for current directory
            {
              desc = ' Search',
              group = '@string',
              action = 'Telescope live_grep cwd=',
              key = '/'
            },
            -- {
            --   desc = ' dotfiles',
            --   group = 'Number',
            --   action = 'Oil --float ~',
            --   key = 'd',
            -- },
            {
              desc = ' Notes',
              group = 'Number',
              action = 'Oil --float ~/Documents/notes',
              key = 'n',
            },
            {
              desc = ' Settings',
              group = "@operator",
              action = "Oil --float ~/.config/nvim",
              key = 's'
            },
            {
              desc = '󰩈 Quit',
              group = "@error",
              action = "quitall",
              key = 'q'
            }
          },
          project = { action = 'Oil --float ' },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
}
