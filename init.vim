"888b    888                  888     888 d8b              
"8888b   888                  888     888 Y8P              
"88888b  888                  888     888                  
"888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b. 
"888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888  888  88b
"888  Y88888 88888888 888  888  Y88o88P   888 888  888  888
"888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888
"888    Y888   Y8888    Y88P"     Y8P     888 888  888  888

"----------------------General Config----------------------"
set nocompatible
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
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set showmatch
set autochdir
set hidden

" -------------------- Plugins Start -------------------- "
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'                       " File Tree
Plug 'flazz/vim-colorschemes'                   " Colourschemes 
Plug 'godlygeek/tabular'                        " Tabulation
Plug 'bfrg/vim-cpp-modern'                      " C++ Syntax highlighting
Plug 'ctrlpvim/ctrlp.vim'                       " File Searching
Plug 'rking/ag.vim'                             " Search
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
Plug 'jiangmiao/auto-pairs'                     " Auto insert brackets

"Plug 'jackguo380/vim-lsp-cxx-highlight'        " C++ Syntax highlighting

call plug#end()
" -------------------- Plugins end ---------------------- "

" -------------------- Plugin Config -------------------- "
colorscheme leo

" -------------------- Nerd Tree ------------------------ "
let NERDTreeMinimalUI = 1

" -------------------- C++ highlight -------------------- "
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" -------------------- AG + Ctrlp Search ---------------- "
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
endif

" -------------------- Keybindings ---------------------- "
map - <C-W>-
map + <C-W>+
