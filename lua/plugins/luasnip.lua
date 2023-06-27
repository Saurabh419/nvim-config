return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  version = '1.*',
  build = 'make install_jsregexp',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/snippets' })
  end,
}
