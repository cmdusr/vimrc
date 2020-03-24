"-----Required-----"
set nocompatible

"-----Plugins Start-----"
call plug#begin('~/.vim/plugged')

" File Tree
Plug 'preservim/nerdtree'
" Colourschemes
Plug 'flazz/vim-colorschemes'
" Tabulation
Plug 'godlygeek/tabular'
" C++ Syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
" File Searching
Plug 'ctrlpvim/ctrlp.vim'
" Search
Plug 'rking/ag.vim'
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto add pairs of brackets
Plug 'jiangmiao/auto-pairs'

call plug#end()
"-----Plugins End-----"

"-----Main Config-----"
set exrc
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set clipboard=unnamed
set incsearch
set noshowmode
set termguicolors
set background=dark
colorscheme leo
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set showmatch
set autochdir
set hidden

"-----Nerd Tree-----"
let NERDTreeMinimalUI = 1

"-----Enhanced C++ highlight-----"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"-----AG + Ctrlp Search-----"
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
endif

"-----Keybindings-----"
map - <C-W>-
map + <C-W>+
