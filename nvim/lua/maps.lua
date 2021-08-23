local map = vim.api.nvim_set_keymap
local utils = require('utils')

-- map the leader key
map('n', ';', '', {})
vim.g.mapleader = ';'  -- 'vim.g' sets global variables

-- Normal
--local noremap = { noremap = true }
local silent = { silent = true }
utils.map('n', '<leader>n', ':nohlsearch<cr>')
utils.map('n', 'Y', 'y$')
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')

utils.map('n', '<C-j>', '<c-w>j')
utils.map('n', '<C-k>', '<c-w>k')
utils.map('n', '<C-l>', '<c-w>l')
utils.map('n', '<C-h>', '<c-w>h')

utils.map('n', '<cr>', 'o<esc>', silent)
utils.map('n', '``', ':w|bd<cr>', silent)

utils.map('n', '<C-s>', ':w<cr>')

-- Folding
utils.map('n', '<space>', 'za', silent)
utils.map('v', '<space>', 'zf')


-- Insert mode stuff
utils.map('i', 'wj', '<Esc>')
utils.map('i', ',', ',<c-g>u')
utils.map('i', '.', '.<c-g>u')
utils.map('i', '!', '!<c-g>u')
utils.map('i', '?', '?<c-g>u')
utils.map('i', '[', '[<c-g>u')

-- Indent
utils.map('n', '<', '<<')
utils.map('n', '>', '>>')
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

-- Moving code
utils.map('n', '<leader>j', ':m .+1<cr>==')
utils.map('n', '<leader>k', ':m .-2<cr>==')
utils.map('i', '<c-j>', '<esc>:m .+1<cr>==i')
utils.map('i', '<c-k>', '<esc>:m .-2<cr>==i')
utils.map('v', 'J', ":m '>+1<cr>gv=gv")
utils.map('v', 'K', ":m '<-2<cr>gv=gv")
