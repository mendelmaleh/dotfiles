" vim: ts=2

" storage
let cache = $HOME."/.local/cache"
if !isdirectory(cache)
  call mkdir(cache)
endif

let &backupdir=cache
let &directory=cache

" settings
filetype plugin indent on
syntax on

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
