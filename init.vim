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
set list!
set incsearch

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
Plug 'itchyny/lightline.vim'                    " Pretty status bar

call plug#end()
" -------------------- Plugins end ---------------------- "

" -------------------- Colourschemes -------------------- "
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

" -------------------- Coc Autocompletion ---------------- "
set updatetime=300
set signcolumn=yes
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" -------------------- Remapping ---------------- "

" Map leader to space
let mapleader= " "

" Edit init.vim
map <leader>rc :e $MYVIMRC<CR>

" Move between windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Open nerdtree centered on current file
nnoremap <leader>n :NERDTreeToggle<Enter>

" Resize splits
map - <C-W>-
map + <C-W>+

" Goto definitions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
