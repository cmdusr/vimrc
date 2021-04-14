"888b    888                  888     888 d8b
"8888b   888                  888     888 Y8P
"88888b  888                  888     888
"888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.
"888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888  888  88b
"888  Y88888 88888888 888  888  Y88o88P   888 888  888  888
"888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888
"888    Y888   Y8888    Y88P"     Y8P     888 888  888  888

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

" -------------------- Functions ---------------- "
function! IsBufferFile()
    return strlen(expand('%')) > 0
endfunction

function! IsBufferModifiable()
    return &modifiable
endfunction

function! IsBufferDiff()
    return &diff
endfunction

function! IsBufferTerminal()
    return &buftype ==# 'terminal'
endfunction

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion

call plug#end()

" -------------------- Colourschemes -------------------- "
colorscheme leo

" -------------------- Nerd Tree ------------------------ "
let NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1

function! NERDTreeIsOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NERDTreeToggleInCurDir()
    if NERDTreeIsOpen()
        NERDTreeClose
    else
        if IsBufferFile() && !IsBufferDiff() && !IsBufferTerminal()
            NERDTreeFind
        else
            NERDTreeToggle
        endif
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

let g:coc_config_home = CONFIG_PATH 

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
