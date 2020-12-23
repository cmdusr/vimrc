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

" -------------------- Remapping ---------------- "

" Map leader to space
let mapleader= " "

" Edit init.vim
map <leader>rc :e $MYVIMRC<CR>
map <leader>src :source $MYVIMRC<CR>

" Move between windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Move between tabs
map <leader>[ :tabprevious<CR>
map <leader>] :tabnext<CR>

" Resize splits
map - :winc <<CR>
map = :winc ><CR>
map _ :winc -<CR>
map + :winc +<CR>

" Escape terminal
:tnoremap <Esc> <C-\><C-n>

" -------------------- Plugins -------------------- "

" End here if plug is not installed
"if !exists('g:loaded_plug')
"	finish
"endif

call plug#begin(stdpath('data').'/plugged')

" Essential
Plug 'preservim/nerdtree'     " File Tree
Plug 'godlygeek/tabular'      " Tabulation
Plug 'flazz/vim-colorschemes' " Colourschemes
Plug 'sheerun/vim-polyglot'   " Language packs
Plug 'itchyny/lightline.vim'  " Pretty status bar
Plug 'jiangmiao/auto-pairs'   " Auto insert brackets

" Nice to have
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" -------------------- Colourschemes -------------------- "
colorscheme leo

" -------------------- Nerd Tree ------------------------ "
let NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 2

function! NERDTreeIsOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NERDTreeToggleInCurDir()
    if NERDTreeIsOpen()
        :NERDTreeClose
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <leader>n :call NERDTreeToggleInCurDir()<CR>

" -------------------- C++ highlight -------------------- "
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

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

" Goto definitions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
