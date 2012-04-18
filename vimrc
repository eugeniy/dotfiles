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

" Load plugin submodules
filetype off
call pathogen#runtime_append_all_bundles()

" Detect the file type, useful for autocmd
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on

" Enable jQuery, lesscss and json syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.less set filetype=less
au BufRead,BufNewFile *.json set ft=javascript

" Autocompile CoffeeScript on write
" autocmd BufWritePost *.coffee silent CoffeeMake!

" Share a system clipboard
" set clipboard=unnamed

" Switch wrap off for everything
" set nowrap

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

" Display a line at 80 characters, needs vim 7.3
set colorcolumn=80

" Highlight trailing white space in ugly red, should come before colorscheme
autocmd ColorScheme * highlight TrailingSpaces ctermbg=darkred guibg=darkred
highlight TrailingSpaces ctermbg=darkred guibg=darkred
match TrailingSpaces /\s\+$/

" Show tabs
set list!
set listchars=tab:→\ 

" Indent-based folding, use za
set foldmethod=indent
set foldlevel=99

" Fix the backspace
set backspace=2

" Switch syntax highlighting on
syntax on

" Highlighting the last used search pattern
set hlsearch
" Unset highlighting with Enter
nnoremap <CR> :noh<CR><CR>

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Numbers
set number

" Enable the mouse
set mouse=a

" Allow to use 256 colors
set t_Co=256
set background=dark
" let g:solarized_termtrans=1
" let g:solarized_visibility="low"
" let g:solarized_termcolors=256

colorscheme solarized

" Enable the spell checker by default
" set spell

" The default make program
" set makeprg=node\ %

" Save automatically before :make
set autowrite

" Automatically decide which compltetion to use
let g:SuperTabDefaultCompletionType="context"
" Close the omnicompletion tip window on selection
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Open a file with Ctrl+T
nmap <silent> <leader>t :CommandT<CR>
let g:CommandTMaxHeight=20

nmap <leader>a <Esc>:Ack! 

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
