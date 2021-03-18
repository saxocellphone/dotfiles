filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'tmsvg/pear-tree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'qpkorr/vim-bufkill'
Plug 'derekwyatt/vim-scala'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
"Plug 'morhetz/gruvbox' 
"Plug 'dense-analysis/ale'
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
call plug#end()

autocmd vimenter * colorscheme sonokai
"autocmd vimenter * colorscheme gruvbox

set clipboard+=unnamedplus
set background=dark
set backspace=indent,eol,start
set hidden
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set number nu rnu
set shiftround
set incsearch
set completeopt-=preview
let g:pymode_python = 'python3'
let mapleader = ';'

""" BEGIN COC settings
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-a> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-pyright'
  \ ]
""" END COC settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

nmap <Leader>f :NERDTreeToggle<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

inoremap wj <Esc>

nnoremap <silent> <Leader>n :noh<cr>

nnoremap <silent> <Leader>w <C-W>k
nnoremap <silent> <Leader>s <C-W>j
nnoremap <silent> <Leader>a <C-W>h
nnoremap <silent> <Leader>d <C-W>l
nnoremap <silent> <S-Enter> O<Esc>
nnoremap <silent> <CR> Do<Esc>p

tnoremap <silent> <Esc> <C-\><C-n>

nnoremap <silent> <Leader>b :ls<cr>
map <silent> <Leader>j :bp<cr>
map <silent> <Leader>k :bn<cr>
nnoremap qq :w\|BD<cr>

if has('nvim')
    autocmd TermOpen term://* startinsert
endif

"VIM-AIRLINE Settings
""set airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
