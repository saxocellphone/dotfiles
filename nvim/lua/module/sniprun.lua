require('sniprun').setup({
    display = {
        "VirtualTextOk",
        "VirtualTextErr",          -- "display error results as virtual text
        --"TempFloatingWindow",      -- "display results in a floating window
        "LongTempFloatingWindow",  -- "same as above, but only long results. To use with VirtualText__
        --"Terminal"                 -- "display results in a vertical split
    },
    snipruncolors = {
        SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
        SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
        SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
        SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  },
})

vim.api.nvim_set_keymap('v', '<cr>', '<Plug>SnipRun', {})
vim.api.nvim_set_keymap('n', '-', '<Plug>SnipClose', {silent = true})

