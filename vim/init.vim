" general config
set term=xterm-256color
set termguicolors
set cscopeverbose
set cscopetag
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
set nonumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
"set incsearch
set hlsearch
set nowrap
set autochdir
filetype on
filetype plugin indent on

" global variables
let g:explore_is_open = 0
let g:quickfix_is_open = 0

" functions
function! ToggleExplore()
    if g:explore_is_open
        let g:explore_is_open = 0
        :Rexplore
    else
        let g:explore_is_open = 1
        :Explore
    endif
endfunction

function! ToggleQuickfix()
    if g:quickfix_is_open
        let g:quickfix_is_open = 0
        :cclose
    else
        let g:quickfix_is_open = 1
        :copen
    endif
endfunction

" highlighting and color
syntax on
" Exception for C, Go and yaml
au! BufNewFile,BufReadPost *.{c,h} set filetype=c
au! BufNewFile,BufReadPost *.{go} set filetype=go
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
au FileType c setlocal noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType sh setlocal ts=2 sts=2 sw=2 expandtab
au FileType markdown setlocal ts=4 sts=4 sw=4 expandtab

set cursorline

set tags=./.tags;/

" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" auto-indent
noremap <silent> <leader>f gg=G<CR>

" show/hide explorer window
noremap <silent> <Leader>e :call ToggleExplore()<CR>
noremap <silent> <Leader>q :call ToggleQuickfix()<CR>
noremap <silent> <Leader>, :cp<CR>
noremap <silent> <Leader>. :cn<CR>

" X copy-paste
set clipboard+=unnamedplus
command -range Gy :silent :<line1>,<line2>w !xsel -i -b
cabbrev gy Gy
command -range Gp :silent :r !xsel -o -b
cabbrev gp Gp

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
nmap <c-Down> 4<Down>
nmap <c-Up> 4<Up>
nmap <c-Left> b
nmap <c-Right> e

" for Visual mode: x[nore]map
xnoremap <c-j> 4j
xnoremap <c-k> 4k
xnoremap <c-h> 4h
xnoremap <c-l> 4l
xnoremap <c-Down> 4<Down>
xnoremap <c-Up> 4<Up>
xnoremap <c-Left> b
xnoremap <c-Right> e

" enable mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" find and replace
nmap S :%s//g<Left><Left>

" on/off relativenumber
" nmap <F3> :set relativenumber! number!<CR>
nmap <F3> :set number!<CR>

" trailing whitespace
nmap <F2> :FixWhitespace<CR>

" noh
nmap <Leader><space> :noh<cr>
