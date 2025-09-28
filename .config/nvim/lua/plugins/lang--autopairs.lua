return {
  -- Autopairs plugin for automatic completion of pairs like {}, "", (), etc.
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
