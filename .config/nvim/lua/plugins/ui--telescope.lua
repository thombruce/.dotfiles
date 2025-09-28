return {
  -- Telescope
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    enabled = true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },
  {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-treesitter/nvim-treesitter',
    }
  },
}
