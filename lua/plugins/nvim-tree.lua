return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader>no',
      function() require('nvim-tree.api').tree.focus() end,
      desc = 'Nvim Tree: Focus',
    },
    {
      '<leader>nn',
      function() require('nvim-tree.api').tree.toggle() end,
      desc = 'Nvim Tree: Toggle',
    },
    {
      '<leader>nf',
      function()
        require('nvim-tree.api').tree.find_file({
          focus = true,
          open = true,
        })
      end,
      desc = 'Nvim Tree: Find File',
    },
  },
  config = true,
}
