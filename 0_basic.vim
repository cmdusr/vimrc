"----------------------General Config----------------------"

set nocompatible         " Drop vi compatibility
set noerrorbells         " No beeps
set noswapfile           " No swap file
set nobackup             " No persistent backup files
set nowritebackup        " No transiant backup files
set encoding=utf-8       " utf-8 encoding
set clipboard=unnamed    " Use system cliboard
set incsearch            " Incrementally search patterns
set noshowmode           " No mode message at the bottom
set termguicolors        " Use modern terminal colours
set background=dark      " Dark background
set tabstop=4            " Number of spaces per tab
set softtabstop=4        " Number of space per tab when editing
set shiftwidth=4         " Number of spaces per indent
set nowrap               " No line wrapping
set number               " Show line numbers
set noshowmatch          " No jumping when inserting brackets
set noautochdir          " No automatic directory changing
set hidden               " No prompt to save
set list                 " Show whitespaces

" -------------------- Remapping ---------------- "

" Map leader to space
let mapleader= " "

" Edit init.vim
nnoremap <leader>rc :e $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move between tabs
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>

" Resize splits
nnoremap - :winc <<CR>
nnoremap = :winc ><CR>
nnoremap _ :winc -<CR>
nnoremap + :winc +<CR>

" Escape terminal
:tnoremap <Esc> <C-\><C-n>
