set nocompatible
set nomodeline
set nobackup
set nowritebackup
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

set autochdir
set cursorline


" Directories for swp files
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup

" Load plugin submodules
filetype off
call pathogen#runtime_append_all_bundles()

" Detect the file type, useful for autocmd
filetype plugin indent on

" Enable jQuery, lesscss and json syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.less set filetype=less
au BufRead,BufNewFile *.json set ft=javascript 

" Autocompile CoffeeScript on write
" autocmd BufWritePost *.coffee silent CoffeeMake!

" Share a system clipboard
set clipboard=unnamed

" Switch wrap off for everything
" set nowrap

" Use soft line breaks
set wrap
set linebreak

set autoindent          " always set auto indenting on

" Soft tabs, 4 spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" Display a line at 80 characters, needs vim 7.3
set colorcolumn=80

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
" let g:solarized_visibility = "low"
" let g:solarized_termcolors=256

colorscheme solarized

" Enable the spell checker by default
" set spell

" The default make program
" set makeprg=node\ %

" Save automatically before :make
set autowrite

" Open a file with Ctrl+T
" nmap <silent> <C-T> :CommandT<CR>
" let g:CommandTMaxHeight=20

" Display the NERD tree on Ctrl+D
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Single click open directories, double for files
let NERDTreeMouseMode=2
" Use arrows instead on bars and +
let NERDTreeDirArrows=1

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
