return {
  { 'folke/tokyonight.nvim', lazy = true },
  { 'marko-cerovac/material.nvim', lazy = true },
  { 'navarasu/onedark.nvim', lazy = true },
  { 'Mofiqul/vscode.nvim', lazy = true },
  { 'projekt0n/github-nvim-theme', lazy = true },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme('catppuccin-frappe') end,
  },
}
