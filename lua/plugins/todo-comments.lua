return {
  'folke/todo-comments.nvim',
  event = 'BufReadPost',
  dependencies = 'nvim-lua/plenary.nvim',
  init = function()
    local map = vim.keymap.set
    map('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Next todo comment' })
    map('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Previous todo comment' })
  end,
  config = true,
}
