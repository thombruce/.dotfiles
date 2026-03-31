vim.pack.del({
  -- Add packages here to delete or reinstall
})

require('plugins.theme')
require('plugins.oil')
require('plugins.telescope')
require('plugins.blink')
require('plugins.neominimap')

vim.pack.add({
  -- LANG
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/windwp/nvim-autopairs',
  -- UI
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/f-person/git-blame.nvim',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/folke/zen-mode.nvim',
  'https://github.com/HiPhish/rainbow-delimiters.nvim',
  'https://github.com/mechatroner/rainbow_csv',
  -- UTILS
  'https://github.com/folke/which-key.nvim',
  'https://github.com/Kohei-Wada/yadm-git.nvim',
})

require("nvim-surround").setup()
require("nvim-autopairs").setup()

require('gitsigns').setup()

require('which-key').setup({
  preset = 'modern'
})

require('yadm-git').setup()

require("mason").setup()

require('nvim-treesitter').setup({
  ensure_installed = {},
  highlight = {
      enable = true
  },
})
