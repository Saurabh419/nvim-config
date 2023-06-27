return {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
  },
  config = true,
}
