local map = vim.api.nvim_set_keymap
local utils = require('utils')

-- map the leader key
map('n', ';', '', {})
vim.g.mapleader = ';'  -- 'vim.g' sets global variables

-- Normal
noremap = { noremap = true }
silent = { silent = true }
utils.map('n', '<leader>n', ':nohlsearch<cr>')
utils.map('n', '<leader>k', ':bnext<cr>')
utils.map('n', '<leader>j', ':bprev<cr>')

utils.map('n', '<C-j>', '<C-W>j<C-W>_')
utils.map('n', '<C-k>', '<C-w>k')
utils.map('n', '<C-l>', '<C-w>l')
utils.map('n', '<C-h>', '<C-W>h<C-W>_')

utils.map('n', '<cr>', 'o<esc>', silent)
utils.map('n', 'qq', ':w|BD<cr>', silent)

utils.map('n', '<C-s>', ':w<cr>')

-- Folding
utils.map('n', '<space>', 'za', silent)
utils.map('v', '<space>', 'zf')


-- Insert mode stuff
utils.map('i', 'wj', '<Esc>')

-- Indent
utils.map('n', '<', '<<')
utils.map('n', '>', '>>')
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
