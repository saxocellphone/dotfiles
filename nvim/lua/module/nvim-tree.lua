require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics  = {
		enable = false
	},

  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

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
