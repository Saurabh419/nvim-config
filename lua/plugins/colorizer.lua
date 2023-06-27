return {
  'norcalli/nvim-colorizer.lua',
  ft = { 'html', 'css', 'jsx', 'tsx' },
  event = 'BufRead',
  opts = {
    'html',
    css = {
      css = true,
    },
    'tsx',
    'jsx',
  },
}
