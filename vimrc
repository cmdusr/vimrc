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

let config_level=2

"----------------------Level 0------------------------------"

set nocompatible                     " Drop vi compatibility
set ttyfast                          " Faster terminal rendering
set belloff=all                      " No beeps
set hidden                           " No prompt to save
set noswapfile                       " No swap file
set nobackup                         " No persistent backup files
set nowritebackup                    " No transiant backup files
set noundofile                       " No backup files
set encoding=utf-8                   " utf-8 encoding
set clipboard=unnamed                " Use system cliboard
set laststatus=2                     " Always have status line
set history=10000                    " Generous history buffer
set wildmenu                         " Enable menu for tab completion
set termguicolors                    " Use modern terminal colours
set background=dark                  " Dark background
set tabpagemax=50                    " Limit number of files opened as tabs from cmdline
set tabstop=4                        " Number of spaces per tab
set softtabstop=4                    " Number of space per tab when editing
set shiftwidth=4                     " Number of spaces per indent
set noexpandtab                      " Use tabs please
set backspace=indent,eol,start       " Makes backspace deleting sane
set mouse=a                          " Enable mouse
set nowrap                           " No line wrapping
set number                           " Show line numbers
set noshowmatch                      " No jumping when inserting brackets
set noautochdir                      " No automatic directory changing
set foldmethod=syntax                " Syntax based code folding
set autoread                         " Reload file if edited outside of vim
set display=lastline                 " Show but truncate long lines
set incsearch                        " Incrementally search patterns
set hlsearch                         " Highlight search
set list                             " Show whitespaces
set listchars=tab:>\ ,trail:-,nbsp:+ " Nice looking whitespace representation
set cino==0                          " Stop adding indentations after the 'case' statement
set formatoptions=                   " Stop autoformating

let mapleader= " "                   " Map leader to space

let netrw_banner=0                   " No banner in the netrw plugin

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
nnoremap <leader>b :let @+ = expand("%:p")<CR> :echo @+<CR>

" Gvim
if has('gui_running')
	set guioptions=c

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
Plug 'romainl/vim-cool'       " Search highlight only when searching

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
nnoremap <leader>v :NERDTreeRefreshRoot<CR> zz

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
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'relative':v:true, 'yoffset': 1.0 } }

nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>rg <cmd>Rg<cr>

command! -bang -nargs=? -complete=dir CPPFiles call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['-q', '.cpp$ !Intermediate']}), <bang>0)
nnoremap <leader>cpp <cmd>CPPFiles<cr>

" Early exit
if config_level < 3
	finish
endif

"----------------------Level 3------------------------------"!

