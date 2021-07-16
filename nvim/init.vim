call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
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
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
Plug 'jlanzarotta/bufexplorer'
Plug 'knubie/vim-kitty-navigator'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'dkprice/vim-easygrep'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'joshdick/onedark.vim'
" Language Specific Plugs
Plug 'pantharshit00/vim-prisma'
Plug 'derekwyatt/vim-scala'
Plug 'neovimhaskell/haskell-vim'
" Previous Plugs
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
"Plug 'morhetz/gruvbox' 
"Plug 'dense-analysis/ale'
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
call plug#end()

""" Sets
filetype plugin on
filetype plugin indent on
syntax on
set foldmethod=indent
set clipboard+=unnamedplus
set background=dark
set backspace=indent,eol,start
set hidden
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set number nu rnu
set shiftround
set incsearch
set hlsearch
set completeopt-=preview
set title
set splitbelow
colorscheme onedark
""" End Sets


""" Remaps
let mapleader = ';'
nnoremap <space> za
vnoremap <space> zf
vnoremap < <gv
vnoremap > >gv
nmap <leader>xx "_dd
vmap <leader>d "_d
nmap <leader>` :sp\|term<CR><ESC>:resize 10<CR>i
inoremap wj <Esc>
nnoremap <silent> <Leader>n :noh<cr>
nnoremap <silent> <CR> o<Esc>
tnoremap <silent> <Esc> <C-\><C-n>
nnoremap <silent> <Leader>b :ls<cr>
map <silent> <Leader>j :bp<cr>
map <silent> <Leader>k :bn<cr>
nnoremap qq :w\|BD<cr>
""" End Remap

""" Misc
highlight clear SignColumn
let &titlestring='%t - nvim'
let g:pymode_python = 'python3'

if has('nvim')
    autocmd TermOpen term://* startinsert
endif

:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist|build'
""" End Misc

""" Begin NerdTree settings
let NERDTreeIgnore=['__pycache__', 'build']
nmap <Leader>f :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
""" End NerdTree settings

""" Other files
for f in globpath('~/.config/nvim', '*.conf', 0, 1, 0)
    execute 'source' f
endfor
