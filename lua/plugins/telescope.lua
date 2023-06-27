return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    {
      '<leader>ff',
      function() require('telescope.builtin').find_files({ hidden = true }) end,
      desc = 'find all [hidden=true]',
    },
    {
      '<C-p>',
      function() require('telescope.builtin').find_files() end,
      desc = 'find files',
    },
    {
      '<leader>fh',
      function() require('telescope.builtin').help_tags() end,
      desc = 'help pages',
    },
    {
      '<leader>fw',
      function() require('telescope.builtin').live_grep() end,
      desc = 'live grep',
    },
  },
}
