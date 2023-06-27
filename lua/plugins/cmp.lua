return {
  'hrsh7th/nvim-cmp',
  event = 'BufRead',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind.nvim',
    'folke/neodev.nvim',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    local snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    }

    local window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    local mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    })

    local formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        max_width = 50,
        ellipsis_char = '...',
      }),
    }

    local sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
    }

    -- cmp setup
    cmp.setup({
      snippet = snippet,
      window = window,
      mapping = mapping,
      sources = sources,
      formatting = formatting,
    })

    -- `/`, `?` cmdline setup.
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })

    -- configuring lsp servers
    require('user.lsp.lspconfig')
    require('user.lsp')
  end,
}
