return {
  -- Autopairs plugin for automatic completion of pairs like {}, "", (), etc.
  -- Other options exist and we should maybe assess...
  -- - mini.surround
  -- - tpope/vim-surround
  -- - machakann/vim-sandwich
  -- - kylechui/nvim-surround (which is maybe just tpope/vim-surround rewritten in Lua?)
  -- - mini.ai (which is listed for comparison by mini.surround and might also be worth assessing)
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
