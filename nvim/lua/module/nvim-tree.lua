vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<cr>', {
	noremap = true,
	silent = true
})

vim.api.nvim_set_keymap('n', '<leader>F', ':NvimTreeFindFile<cr>', {
	noremap = true,
	silent = true
})

vim.g.nvim_tree_ignore = {
	'.git',
	'node_modules',
	'.cache',
	'.direnv',
	'.mypy_cache',
	'.pytest_cache'
}
