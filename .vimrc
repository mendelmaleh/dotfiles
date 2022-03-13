" vim: ts=2

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" autoinstall missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \ | PlugInstall --sync | source $MYVIMRC endif

" load plugins
call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" storage
let cache = $HOME."/.local/cache"
if !isdirectory(cache)
  call mkdir(cache, "p")
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
set hidden
set autowrite
set encoding=utf-8
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=100
set updatetime=100

" commands
set ignorecase
set smartcase
set wildmode=longest:list

" indents
set tabstop=4
set shiftwidth=0      " use tabstop
set softtabstop=-1    " use shiftwidth

set expandtab
set autoindent
set smartindent

" search
nnoremap \\ :noh<cr>  " clear highlighting

" lcs
nmap <leader>l :set list!<CR>

" rg
if executable('rg')
  let g:gitgutter_grep = 'rg'
endif

" gitgutter
let g:gitgutter_signs = 0
nnoremap <leader>g :GitGutterSignsToggle<CR>

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_formatter = 1

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" golang
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0

au FileType go nmap <C-]> :GoDef<CR>
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" run :GoBuild :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
