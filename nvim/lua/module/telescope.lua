require("telescope").setup {
  defaults = {

  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      path_display = {
        'shorten',
        'absolute'
      },
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- Right hand side can also be the name of the action as a string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    find_files = {
      theme = "dropdown"
    }
  },
  extensions = {
    --frecency = {
      --db_root = "home/my_username/path/to/db_root",
      --show_scores = false,
      --show_unindexed = true,
      --ignore_patterns = {"*.git/*", "*/tmp/*"},
      --disable_devicons = false,
      --workspaces = {
        --["conf"]    = "~/.config",
        --["data"]    = "~/.local/share",
        --["project"] = "~/Documents",
      --}
    --}
  --}
  }
}

vim.api.nvim_set_keymap('n', '<C-e>', ':Telescope buffers<cr>', {
	noremap = true,
	silent = true
})

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<cr>', {
	noremap = true,
	silent = true
})

vim.api.nvim_set_keymap('n', '<C-a>', ':Telescope live_grep<cr>', {
	noremap = true,
	silent = true
})
