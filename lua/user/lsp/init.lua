-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require('neodev').setup({})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- configuring some lsp servers
for _, lsp_server in ipairs({
  'html',
  'cssls',
  'emmet_ls',
  'jsonls',
  'sqlls',
  'prismals',
  'tsserver',
  'bashls',
  'pyright',
  'gopls',
}) do
  lspconfig[lsp_server].setup({
    capabilities = capabilities,
  })
end

-- clangd
lspconfig.clangd.setup({
  capabilities = vim.tbl_deep_extend('force', capabilities, {
    offsetEncoding = 'utf-8',
  }),
})

-- lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          [vim.fn.stdpath('data') .. '/lazy/lazy.nvim/lua/lazy'] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
        checkThirdParty = false,
      },
    },
  },
})
