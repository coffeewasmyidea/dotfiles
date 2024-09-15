" ----------------------------------------------------------------------------
"     NVIM config
"     Sergey Silaev <hello@8am.dev>
"     date: 09-15-2024
"
" ----------------------------------------------------------------------------

" Leader
let g:mapleader="\\"

" Default settings
filetype plugin indent on
syntax on

set nosmd
set backspace=indent,eol,start
set completeopt = ""
set expandtab
set fillchars+=vert:│
set hidden
set ignorecase
set incsearch
set mouse=
set nomodeline
set nopreviewwindow
set noswapfile
set nowrap
set ruler
set showmode
set smartcase
set smartindent
set shiftwidth=4
set tabstop=4
set ttimeoutlen=20
set whichwrap=b,s,<,>,h,l,[,]
set laststatus=2
set undodir=$HOME/.cache/nvim/undodir
set undofile
set colorcolumn=+1
set number

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Enable mode keys in RU layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Copy/Paste to the system clipboard
set clipboard=unnamedplus

" UltiSnips
let g:UltiSnipsExpandTrigger = '<leader>t'

" Number
nmap <F3> :set nu!<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Git blame
nnoremap <leader>b :Git blame<CR>

" Git status
nnoremap <leader>gs :Git<CR>

" Telescope
nnoremap <C-f> :lua require('telescope.builtin').live_grep()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>

" Resize windows
nmap <M-Left> :vertical resize -4<CR>
nmap <M-Right> :vertical resize +4<CR>
nmap <M-Down> :resize +4<CR>
nmap <M-Up> :resize -4<CR>

" Curly braces & square brackets
nmap <Leader>" ysiw"
nmap <Leader>} ysiw}
nmap <Leader>] ysiw]

" Navigate 4x faster when holding down Ctrl
nmap <C-j> 4j
nmap <C-k> 4k
nmap <C-l> 4l
nmap <C-h> 4h
nmap <C-Down> 4<Down>
nmap <C-Up> 4<Up>
nmap <C-Left> b
nmap <C-Right> e

" For visual mode: x[nore]map
xnoremap <C-j> 4j
xnoremap <C-k> 4k
xnoremap <C-h> 4h
xnoremap <C-l> 4l
xnoremap <C-Down> 4<Down>
xnoremap <C-Up> 4<Up>
xnoremap <C-Left> b
xnoremap <C-Right> e

" Join with cursor stay in place
nmap J, mzJ`z"

" Search with cursor stay in the middle
nmap n nzzzv
nmap N Nzzzv

" Find and replace
nmap S :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Better Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 15
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" Explore
nmap <Leader>e :Ex<CR>
nmap <Leader>s :Vexplore<CR>
nmap <Leader>S :Hexplore<CR>
nmap <Leader>T :Texplore<CR>

" Python
let g:python3_host_prog = "$HOME/.pyenv/shims/python"
let g:black_linelength = 120

" ----------------------------------------------------------------------------
"     - FUNCTIONS -
" ----------------------------------------------------------------------------
function! RemoveTrailingSpaces()
    let save_cursor = getpos(".")
    %s/\s\+$//e
    call setpos('.', save_cursor)
endfunction

command! RemoveTrailingSpaces call RemoveTrailingSpaces()

" Remove trailing spaces
nnoremap <F2> :RemoveTrailingSpaces<CR>

" noh
nmap <Leader><space> :noh<cr>
