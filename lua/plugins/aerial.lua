return {
  'stevearc/aerial.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    vim.keymap.set('n', '<leader>A', '<cmd>AerialToggle<CR>')
  end,
  opts = {},
}
