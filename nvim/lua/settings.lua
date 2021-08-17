local o = vim.o
local wo = vim.wo
local bo = vim.bo

local cmd = vim.cmd
local utils = require('utils')
local globals = require('globals')

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.smarttab = true
o.laststatus = 2
o.clipboard = [[unnamed,unnamedplus]]
o.shiftround = true
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
o.lazyredraw = true
if globals.is_mac then
    o.shell='/usr/local/bin/fish'
end
--o.expandtab = true

-- window-local options
wo.number = true
wo.relativenumber = true
wo.linebreak = true
--wo.cursorline = true
--wo.foldmethod = [[expr]]
--wo.foldexpr= [[nvim_treesitter#foldexpr()]]

-- buffer-local options
bo.expandtab = true
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.autoindent = true

-- others
cmd 'colorscheme onedark'
