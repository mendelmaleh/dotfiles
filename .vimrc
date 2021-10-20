" vim: ts=2

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
call plug#end()

" storage
let cache = $HOME."/.local/cache"
if !isdirectory(cache)
  call mkdir(cache)
endif

let &backupdir=cache
let &directory=cache

" colors
filetype plugin indent on
syntax on
colorscheme iceberg

set termguicolors
set background=dark

" settings
set modeline


" indents
set tabstop=4
set shiftwidth=0      " use tabstop
set softtabstop=-1    " use shiftwidth

set expandtab
set autoindent
set smartindent

" search
nnoremap \\ :noh<cr>  " clear highlighting
