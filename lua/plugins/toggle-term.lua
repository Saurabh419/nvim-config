return {
  'akinsho/toggleterm.nvim',
  version = '',
  cmd = 'ToggleTerm',
  init = function() vim.keymap.set({ 'n', 't' }, '<leader>v', '<cmd>ToggleTerm<cr>', { desc = 'toggle terminal' }) end,
  config = true,
}
