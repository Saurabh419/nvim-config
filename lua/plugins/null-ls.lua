return {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufRead',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'williamboman/mason.nvim',
  },
  opts = function()
    local null_ls = require('null-ls')

    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover
    local completion = null_ls.builtins.completion

    return {
      sources = {
        -- formatting
        formatting.clang_format, -- c/c++ formatter
        formatting.prettierd, -- prettier formatting
        formatting.stylua, -- lua formatter
        formatting.autoflake, -- python import formatter
        formatting.black, -- python formatter
        formatting.rustfmt, -- rust formatter
        formatting.golines, -- go long line formatter
        formatting.goimports_reviser, -- go import formatter
        formatting.gofumpt, -- go formatter
        formatting.sqlfmt, -- sql formatter
        formatting.beautysh, -- shell script formatter
        -- diagnostics
        diagnostics.mypy, -- python linter
        diagnostics.staticcheck, -- go linter
        diagnostics.luacheck, -- lua linter
        -- code_actions
        code_actions.gomodifytags, -- go code_actions
        code_actions.gitsigns, -- gitsigns
      },
    }
  end,
}
