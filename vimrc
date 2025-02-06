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

" Level 0: No plugins       (Zero dependencies, works out of the box)
" Level 1: Basic plugins    (Minimal dependencies, typically a simple vimscript)
" Level 2: Standard plugins (Requires standalone tools such as ripgrep)
" Level 3: Advaned plugins  (Language server, debugging etc)
let config_level=0

" Reminders
"	gvim --remote-tab-silent -> Open file in existing GVim

"	:noh            -> shut off highlighting after search
"	:Vex            -> Run netrw as a vertical split
"	:cd / lcd / tcd -> Change dir globally / window / tab
"	%:h             -> Current dir
"	(netrw) gn      -> Set tree root

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
set foldmethod=syntax                " Syntax based code folding
set autoread                         " Reload file if edited outside of vim
set display=lastline                 " Show but truncate long lines
set incsearch                        " Incrementally search patterns
set hlsearch                         " Highlight search
set list                             " Show whitespaces
set listchars=tab:>\ ,trail:-,nbsp:+ " Nice looking whitespace representation
set cino==0                          " Stop adding indentations after the 'case' statement
set autoindent                       " Add indents
"set formatoptions-=cro               " Stop autoformating

set autochdir                        " Automatic directory changing

autocmd GUIEnter * simalt ~x         " Make GVim big when opening (Windows only?)
syntax on                            " Turn on syntax highlighting always
colorscheme retrobox                 " Backup builtin colourscheme

let g:netrw_liststyle=3              " Netrw Tree
let g:netrw_fastbrowse=0             " Netrw don't move the cursor

let mapleader= " "                   " Map leader to space

" Edit vimrc
nnoremap <leader>rc :e $MYVIMRC<CR>
nnoremap <leader>vrc :vsp $MYVIMRC<CR>
nnoremap <leader>trc :tabe $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move windows around
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>

" Resize windows
nnoremap <leader>= :wincmd =<CR>
nnoremap <leader>_ :wincmd _<CR>
"nnoremap <leader>- :wincmd |<CR> " Does not work for some reason

" Move between tabs
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>

" Create new tab from current buffer
nnoremap <leader>p :tab split<CR>

" Escape terminal
tnoremap <silent> <Esc> <C-\><C-n>

" Copy path of current buffer to paste buffer
nnoremap <leader>b :let @+ = expand("%:p")<CR> :echo @+<CR>

" Copy name of current file to find buffer
nnoremap <leader>n :let @/ = expand("%:t")<CR> :echo @/<CR>

" Set GVim font
if has('gui_running')
	set guioptions=c
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h12
	elseif has("gui_win32")
		set guifont=Consolas:h12:cANSI
	endif
endif

" Plugins
if config_level < 1
	finish
endif

" Requires Plug
if has('win32')
	call plug#begin('C:\tools\vim\vimfiles\plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'itchyny/lightline.vim' " Status bar
Plug 'godlygeek/tabular'     " Tabulation
Plug 'sheerun/vim-polyglot'  " Language packs
Plug 'tpope/vim-surround'    " Surround text with quotes etc

if config_level >= 2
	Plug 'junegunn/fzf', {'do': {-> fzf#install()}} " Fuzzy search utility
	Plug 'junegunn/fzf.vim'                         " Integration with vim
endif

" Audit
"	Statusline adds useful info but is not strictly nessesary
"		Could add custom statusline with autocmd?
"	Might not need language packs
"	Could replace tabulation with regex
"	Vim surround is handy but I don't really use it
"	Fzf is useful without 10x

call plug#end()

colorscheme leo " Prefered colourscheme which we should have if we have plug
set noshowmode  " Statusline, Dont show mode message at the bottom

if config_level < 2
	finish
endif

" Fzf search
nnoremap <leader>f <cmd>Files<cr>
nnoremap <leader>r <cmd>Rg<cr>

if config_level < 3
	finish
endif
