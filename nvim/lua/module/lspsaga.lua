require('lspsaga').init_lsp_saga {
  finder_action_keys = {
    open = '<cr>', vsplit = '<c-v>', split = '<c-x>',quit = 'q'
  }
}

vim.cmd [[
    nnoremap <silent>K :Lspsaga hover_doc<CR>
    nnoremap <silent>gi :Lspsaga preview_definition<CR>
    nnoremap <silent>gf :Lspsaga lsp_finder<CR>
    nnoremap <silent>ga :Lspsaga code_action<CR>
    nnoremap <silent>gs :Lspsaga signature_help<CR>
    nnoremap <silent>gr :Lspsaga rename<CR>
    nnoremap <silent>[g :Lspsaga diagnostic_jump_prev<CR>
    nnoremap <silent>]g :Lspsaga diagnostic_jump_next<CR>
]]
