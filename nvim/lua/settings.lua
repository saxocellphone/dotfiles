local o = vim.o
local wo = vim.wo
local bo = vim.bo

local cmd = vim.cmd
local utils = require('utils')

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.smarttab = true
o.laststatus = 2
o.tabstop = 4
o.shiftwidth = 4
o.clipboard = [[unnamed,unnamedplus]]
o.shiftround = true
o.expandtab = true
o.showmatch = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.backspace = [[indent,eol,start]]
o.hidden = true
o.splitbelow = true
o.splitright = true
o.title = true
o.termguicolors = true
o.syntax = [[on]]


-- window-local options
wo.number = true
wo.cursorline = true
wo.relativenumber = true
--wo.foldmethod = indent
--wo.wrap = false

-- buffer-local options
bo.expandtab = true

-- others
cmd 'colorscheme onedark'
utils.create_augroup({
  {'BufWinEnter', '*', [[let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))]]}
}, 'Auto Unfold')
