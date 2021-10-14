actions = require('telescope.actions')
globals = require('globals')
local db_root = ""
if globals.is_linux then
  db_root = "/home/vnazzaro/.local/share/nvim/databases"
elseif globals.is_mac then
  db_root = "/Users/vnazzaro/.local/share/nvim/databases"
else
  print("Nvim database path not configed")
end
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-Down>"] = actions.cycle_history_next,
        ["<C-Up>"] = actions.cycle_history_prev,
      }
    },
    history = {
      path = db_root .. '/telescope_history.sqlite3',
      limit = 100,
    }
  },
  pickers = {
    buffers = {
      sort_mru = true,
      theme = "dropdown",
      previewer = false,
      path_display = {
        'shorten',
        'absolute'
      },
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
          -- Right hand side can also be the name of the action as a string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        }
      }
    },
    find_files = {
      theme = "dropdown"
    }
  },
  extensions = {
    --frecency = {
      --db_root = db_root,
      --show_scores = true,
      --show_unindexed = false,
      --ignore_patterns = {"*.git/*", "*/tmp/*"},
      --disable_devicons = false,
      --workspaces = {
        --["conf"]    = "~/.config",
        --["data"]    = "~/.local/share",
        --["project"] = "~/Documents/projects",
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

--vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope frecency<cr>', {
	--noremap = true,
	--silent = true
--})

vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<cr>', {
	noremap = true,
	silent = true
})

require('telescope').load_extension('smart_history')
--require("telescope").load_extension("frecency")
