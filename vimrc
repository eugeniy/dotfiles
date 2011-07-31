set nocompatible
set nomodeline
set nobackup
set nowritebackup
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

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
autocmd BufWritePost *.coffee silent CoffeeMake!

" Switch wrap off for everything
" set nowrap

" Use soft line breaks
set wrap
set linebreak

set autoindent          " always set auto indenting on

" Soft tabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Numbers
set number

" Allow to use 256 colors 
set t_Co=256
colorscheme railscasts

" Enable the spell checker by default
" set spell

" The default make program
set makeprg=node\ %

" Save automatically before :make
set autowrite

