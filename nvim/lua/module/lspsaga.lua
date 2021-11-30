require('lspsaga').init_lsp_saga {
  finder_action_keys = {
    open = '<cr>', vsplit = '<c-v>', split = '<c-x>',quit = 'q'
  }
}

vim.cmd [[
  nnoremap <silent>K  :Lspsaga hover_doc<CR>
  nnoremap <silent>H  :Lspsaga show_line_diagnostics<CR>
  nnoremap <silent>gi :Lspsaga preview_definition<CR>
  nnoremap <silent>gf :Lspsaga lsp_finder<CR>
  nnoremap <silent>ga :Lspsaga code_action<CR>
  nnoremap <silent>gr :Lspsaga rename<CR>
  nnoremap <silent> <C-Up> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  nnoremap <silent> <C-Down> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
]]
