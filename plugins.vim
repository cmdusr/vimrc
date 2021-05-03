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

let g:coc_config_home=stdpath('config')

"let g:coc_config_home = CONFIG_PATH

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
