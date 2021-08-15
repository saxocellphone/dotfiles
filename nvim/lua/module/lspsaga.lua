require('lspsaga').init_lsp_saga {
  finder_action_keys = {
    open = '<cr>', vsplit = '<c-v>', split = '<c-x>',quit = 'q'
  }
}

vim.cmd [[
  nnoremap <silent>gi :Lspsaga preview_definition<CR>
  nnoremap <silent>gf :Lspsaga lsp_finder<CR>
  nnoremap <silent>ga :Lspsaga code_action<CR>
  nnoremap <silent>gr :Lspsaga rename<CR>
  nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
]]
