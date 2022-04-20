" 888     888 d8b
" 888     888 Y8P
" 888     888
" Y88b   d88P 888 88888b.d88b.  888d888 .d8888b
"  Y88b d88P  888 888  888  88b 888P"  d88P"
"   Y88o88P   888 888  888  888 888    888
"    Y888P    888 888  888  888 888    Y88b.
"     Y8P     888 888  888  888 888     "Y8888P
"-----------------------------------------------------------"
" Colossal ascii

" Level 0: Zero dependencies
" Level 1: Basic plugins    (Zero dependencies, typically a simple vimscript)
" Level 2: Standard plugins (Requires standalone tools such as ripgrep)
" Level 3: Advaned plugins  (Language server, debugging etc)

let config_level=3

"----------------------Level 0------------------------------"

set nocompatible         " Drop vi compatibility
set belloff=all          " No beeps
set ttyfast              " Faster terminal rendering
set hidden               " No prompt to save
set noswapfile           " No swap file
set nobackup             " No persistent backup files
set nowritebackup        " No transiant backup files
set noundofile           " No backup files
set encoding=utf-8       " utf-8 encoding
set clipboard=unnamed    " Use system cliboard
set laststatus=2         " Always have status line

set termguicolors        " Use modern terminal colours
set background=dark      " Dark background

set tabstop=4            " Number of spaces per tab
set softtabstop=4        " Number of space per tab when editing
set shiftwidth=4         " Number of spaces per indent
set noexpandtab          " Use tabs please

set nowrap               " No line wrapping
set number               " Show line numbers
set noshowmatch          " No jumping when inserting brackets
set noautochdir          " No automatic directory changing
set foldmethod=syntax    " Syntax based code folding
set autoread             " Reload file if edited outside of vim

set incsearch            " Incrementally search patterns
set hlsearch             " Highlight search

set list                             " Show whitespaces
set listchars=tab:>\ ,trail:-,nbsp:+ " Nice looking whitespace representation

set cino==0               " Stop adding indentations after the 'case' statement
set formatoptions-=ro     " Stop adding comments after a comment

" Neovim defaults
set backspace=indent,eol,start " Make deleting easier
set complete-=i                " ???
set display=lastline           " Show but truncate long lines
set formatoptions=tcqj         " Behavour of pasting
set history=10000              " Number of lines remembered in history
set mouse=a                    " Enable mouse
set nrformats=bin,octal,hex    " Recognise number formats
set tabpagemax=50              " Limit number of files opened as tabs
set viminfo+=!                 " Add additons to the viminfo option
set wildmenu                   " Enable menu for tab completion

" Map leader to space
let mapleader= " "

" Edit vimrc
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

" Create new tab from current buffer
nnoremap <leader>p :tab split<CR>

" Escape terminal
:tnoremap <Esc> <C-\><C-n>

" Copy path of current buffer to paste buffer
nnoremap <leader>b :let @+ = expand("%:p")<CR>

" Gvim
if has('gui_running')
	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	set guioptions -=l
	set guioptions -=b
	set guioptions -=R
	set guioptions -=L
	set guioptions -=B

	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
endif

" Early exit for minimal config
if config_level < 1
	finish
endif

"----------------------Level 1------------------------------"

if has('win32')
	call plug#begin('C:\tools\vim\vimfiles\plugged')
else
	call plug#begin('~/.vim/plugged')
endif

" Basic plugins
Plug 'preservim/nerdtree'     " File Tree
Plug 'godlygeek/tabular'      " Tabulation
Plug 'flazz/vim-colorschemes' " Colourschemes
Plug 'sheerun/vim-polyglot'   " Language packs
Plug 'itchyny/lightline.vim'  " Pretty status bar
Plug 'jiangmiao/auto-pairs'   " Auto insert brackets
Plug 'tpope/vim-surround'     " Surround text with quotes etc

" Standard plugins
if config_level >= 2
	" Fuzzy finder
	Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
	Plug 'junegunn/fzf.vim'
endif

" Advanced plugins
if config_level >= 3
	" LSP
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'

	" Autocomplete with LSP
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

call plug#end()

autocmd FileType vim let b:vcm_tab_complete = 'vim'

" Statusline, Dont show mode message at the bottom
set noshowmode

" Colourscheme
colorscheme leo

" Nerd tree
let NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR> zz

" C++ Highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Early exit
if config_level < 2
	finish
endif

"----------------------Level 2------------------------------"

" FZF
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>rg <cmd>Rg<cr>

" Early exit
if config_level < 3
	finish
endif

"----------------------Level 3------------------------------"

if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'clangd',
			\ 'cmd': {server_info->['clangd', '-background-index']},
			\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
			\ })
		autocmd FileType c setlocal omnifunc=lsp#complete
		autocmd FileType cpp setlocal omnifunc=lsp#complete
		autocmd FileType objc setlocal omnifunc=lsp#complete
		autocmd FileType objcpp setlocal omnifunc=lsp#complete
	augroup end
endif

let g:lsp_diagnostics_enabled=1         " disable diagnostics support
let g:lsp_diagnostics_virtual_text_enabled=1
let g:lsp_diagnostics_float_cursor=1
let g:lsp_diagnostics_float_cursor=1
let g:lsp_diagnostics_highlights_enabled=1

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	inoremap <buffer> <expr><c-f> lsp#scroll(+4)
	inoremap <buffer> <expr><c-d> lsp#scroll(-4)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
