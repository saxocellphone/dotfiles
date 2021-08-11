vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<cr>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<leader>F', ':NvimTreeFindFile<cr>', {
	noremap = true,
	silent = true
})

vim.api.nvim_command('au BufWinEnter NvimTree setl statusline=Hi!')
