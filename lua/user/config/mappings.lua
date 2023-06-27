local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- some mappings
map({ 'i', 'v' }, '<C-j>', '<esc>')
map('n', '<leader>qq', '<cmd>wincmd q<cr>', { desc = 'close window' })
map('n', '<C-s>', ':<C-U>w<cr>')
map('t', '<C-x>', '<C-\\><C-n>')
