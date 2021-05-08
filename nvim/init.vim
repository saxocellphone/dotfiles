call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
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
Plug 'jlanzarotta/bufexplorer'
Plug 'knubie/vim-kitty-navigator'
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"Plug 'morhetz/gruvbox' 
"Plug 'dense-analysis/ale'
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
call plug#end()
let mapleader = ';'

autocmd vimenter * colorscheme sonokai
autocmd vimenter * AirlineTheme simple
let g:airline_extensions = ["branch"]
"autocmd vimenter * colorscheme gruvbox
filetype plugin on
filetype plugin indent on
syntax on
set foldmethod=indent
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
nnoremap <space> za
vnoremap <space> zf
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
set title
set splitbelow
let &titlestring='%t - nvim'
let g:pymode_python = 'python3'
vnoremap < <gv
vnoremap > >gv

nmap <leader>dd "_dd
vmap <leader>d "_d
nmap <leader>` :sp\|term<CR><ESC>:resize 10<CR>i

" Figure out the system Python for Neovim.
"if exists("$VIRTUAL_ENV")
    "let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
"else
    "let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
"endif

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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
""" END COC settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
let NERDTreeIgnore=['__pycache__']

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
