filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
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
Plug 'morhetz/gruvbox' 
Plug 'ap/vim-buftabline'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
call plug#end()

autocmd vimenter * colorscheme gruvbox

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
  \ 'coc-json' 
  \ ]


""" END COC settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let mapleader = ';'
nmap <F6> :NERDTreeToggle<CR>

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

if has('nvim')
    autocmd TermOpen term://* startinsert
endif
