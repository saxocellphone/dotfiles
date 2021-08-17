local map = vim.api.nvim_set_keymap
local utils = require('utils')

-- map the leader key
map('n', ';', '', {})
vim.g.mapleader = ';'  -- 'vim.g' sets global variables

-- Normal
--local noremap = { noremap = true }
local silent = { silent = true }
utils.map('n', '<leader>n', ':nohlsearch<cr>')
utils.map('n', '<leader>k', ':bnext<cr>')
utils.map('n', '<leader>j', ':bprev<cr>')

utils.map('n', '<C-j>', '<c-w>j')
utils.map('n', '<C-k>', '<c-w>k')
utils.map('n', '<C-l>', '<c-w>l')
utils.map('n', '<C-h>', '<c-w>h')

utils.map('n', '<cr>', 'o<esc>', silent)
utils.map('n', 'zz', ':w|bd<cr>', silent)

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
