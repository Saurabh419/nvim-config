-- global mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- attach to lsp buffer
local augroup = vim.api.nvim_create_augroup('UserLspConfig', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(ev)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'lsp declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'lsp definition' })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'lsp implementation' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'lsp references' })
    vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol, { buffer = ev.buf, desc = 'lsp document_symbol' })
    vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, { buffer = ev.buf, desc = 'lsp workspace_symbol' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'lsp hover' })
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'lsp type_definition' })
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'lsp signature_help' })
    -- rename
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'lsp rename' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'lsp rename' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'lsp code_action' })
    -- formatting
    vim.keymap.set(
      'n',
      '<leader>fm',
      function() vim.lsp.buf.format({ async = true }) end,
      { buffer = ev.buf, desc = 'lsp code formating' }
    )
  end,
})
