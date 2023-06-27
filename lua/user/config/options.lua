-- disable some builtin plugin
for _, builtin_plugin in ipairs({
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'matchit',
  'matchparen',
  'logiPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}) do
  vim.g['loaded_' .. builtin_plugin] = 1
end

-------------------------------------- globals -----------------------------------------
vim.g.mapleader = ' '
vim.g.material_style = 'deep ocean'

-------------------------------------- options ------------------------------------------
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.cursorline = false

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.ruler = false

-- Indenting
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.opt.fillchars = { eob = ' ' }
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = 'a'

-- disable nvim intro
vim.opt.shortmess:append('sI')

vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 400
vim.o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append('<>[]hl')

-- disable some default providers
for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end
