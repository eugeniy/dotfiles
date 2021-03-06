set nocompatible
set encoding=utf-8
set nomodeline
set nobackup
set nowritebackup
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" set autochdir
set cursorline

let mapleader = ","

" Directories for swp files
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup

" Load plugins and their helptags
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Switch syntax highlighting on
" syntax sync minlines=200  " otherwise things get really slow with very large files
syntax on

" Disable syntastic for python, use python-mode instead
let g:syntastic_disabled_filetypes = ['python']
" Open an error window
let g:syntastic_auto_loc_list=1

" Enable jQuery, lesscss and json syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.less set filetype=less
au BufRead,BufNewFile *.json set ft=javascript

" Autocompile CoffeeScript on write
" autocmd BufWritePost *.coffee silent CoffeeMake!

" Share a system clipboard
" set clipboard=unnamed

" Use soft line breaks
set wrap
set linebreak

set autoindent          " always set auto indenting on

" Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use 2 spaces in Ruby instead of 4
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Display a line at 79 characters, needs vim 7.3
set colorcolumn=79

" Show tabs
set list!
set listchars=tab:→\ 

" Indent-based folding
" set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Fix the backspace
set backspace=2

" Highlighting the last used search pattern
set hlsearch
" Unset highlighting with Enter
nnoremap <CR> :noh<CR><CR>

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Numbers
set number

" Indicate we have a fast connection
set ttyfast
" Don't redraw when running macros
set lazyredraw

" Enable the mouse
set mouse=a

" Allow to use 256 colors
set t_Co=256
set background=dark
" let g:solarized_termtrans=1
" let g:solarized_visibility="low"
" let g:solarized_termcolors=256

colorscheme solarized
" colorscheme molokai

" Highlight bad spelling and syntax instead of underlining
highlight SpellBad ctermbg=darkred ctermfg=black cterm=none

" The default make program
" set makeprg=node\ %

" Save automatically before :make
" set autowrite

nmap <leader>a <Esc>:Ack! 

" Remap CtrlP
let g:ctrlp_map = '<leader>t'
set wildignore+=*.pyc,*.swo
" Use the perforce config as a main root for the search
let g:ctrlp_root_markers = ['.p4config']
let g:ctrlp_clear_cache_on_exit = 0

" Display the NERD tree on Ctrl+D
nmap <silent> <leader>n :NERDTreeToggle<CR>

" Single click open directories, double for files
let NERDTreeMouseMode=2
" Use arrows instead on bars and +
let NERDTreeDirArrows=1
" Hide pyc files
let NERDTreeIgnore = ['\.pyc$']

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Perforce stuff
nnoremap <leader>p4a :!p4 add %<CR>
nnoremap <leader>p4e :!p4 edit %<CR>
nnoremap <leader>p4r :!p4 revert %

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
