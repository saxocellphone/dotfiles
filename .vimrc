filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'
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
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set backspace=indent,eol,start
set hidden
set laststatus=2
set smarttab
set showmatch
set number nu rnu
set shiftround
set incsearch
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:pymode_python = 'python3'

nmap <F6> :NERDTreeToggle<CR>
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
let mapleader = ','
