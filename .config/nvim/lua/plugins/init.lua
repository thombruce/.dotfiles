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

-- Map .cal files to calchemy filetype
vim.filetype.add({
  extension = {
    cal = 'calchemy',
  },
})

-- Register calchemy parser BEFORE nvim-treesitter.setup()
-- TODO: When tree-sitter-calchemy is published, remove this block and use :TSInstall calchemy
require('nvim-treesitter.parsers').calchemy = {
  install_info = {
    path = '/home/thombruce/Development/tree-sitter-calchemy',
    queries = 'queries/calchemy',
  },
}

-- Add grammar directory to runtime path for queries
vim.opt.runtimepath:prepend('/home/thombruce/Development/tree-sitter-calchemy')

-- Set up nvim-treesitter
require('nvim-treesitter').setup({
  ensure_installed = {},
  -- auto_install = true,
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = { 'ruby', 'markdown' },
  },
})

-- Start treesitter for languages requiring explicit highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'calchemy', 'todotxt' },
  callback = function()
    vim.treesitter.start()
  end,
})
