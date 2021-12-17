" 888     888 d8b
" 888     888 Y8P
" 888     888
" Y88b   d88P 888 88888b.d88b.  888d888 .d8888b
"  Y88b d88P  888 888 "888 "88b 888P"  d88P"
"   Y88o88P   888 888  888  888 888    888
"    Y888P    888 888  888  888 888    Y88b.
"     Y8P     888 888  888  888 888     "Y8888P
"-----------------------------------------------------------"
" Colossal

" Level 0: Minimal  config with zero dependencies (No    plugins)
" Level 1: Standard config with few  dependencies (Small plugins)
" Level 2: Advanced config with many dependencies (Large plugins)

let config_level=0

"----------------------Level 0------------------------------"

set nocompatible         " Drop vi compatibility
set belloff=all          " No beeps
set ttyfast              " Faster terminal rendering
set hidden               " No prompt to save
set noswapfile           " No swap file
set nobackup             " No persistent backup files
set nowritebackup        " No transiant backup files
set encoding=utf-8       " utf-8 encoding
set clipboard=unnamed    " Use system cliboard

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

set list                              " Show whitespaces
set listchars=tab:>\ ,trail:-,nbsp:+  " Nice looking whitespace representation

" Neovim defaults
set backspace=indent,eol,start        " Make deleting easier
set complete-=i                       " ???
set display=lastline                  " Show but truncate long lines
set formatoptions=tcqj                " Behavour of pasting
set history=10000                     " Number of lines remembered in history
set laststatus=2                      " Always have status line
set mouse=a                           " Enable mouse
set nrformats=bin,octal,hex           " Recognise number formats
set tabpagemax=50                     " Limit number of files opened as tabs
set viminfo+=!                        " Add additons to the viminfo option
set wildmenu                          " Enable menu for tab completion

"set sessionoptions-=options
"set autoindent
"set langnoremap                      " Does not apply characters from a language mapping

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

" Early exit for minimal config
if config_level < 1
	finish
endif

"----------------------Level 1------------------------------"

" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" All plugins go here
call plug#begin(stdpath('data').'/plugged')

" Basic plugins
Plug 'preservim/nerdtree'     " File Tree
Plug 'godlygeek/tabular'      " Tabulation
Plug 'flazz/vim-colorschemes' " Colourschemes
Plug 'sheerun/vim-polyglot'   " Language packs
Plug 'itchyny/lightline.vim'  " Pretty status bar
Plug 'jiangmiao/auto-pairs'   " Auto insert brackets

" Advanced plugins
if config_level >= 2
    Plug 'neovim/nvim-lspconfig'                     " Neovim configs for builtin lsp
    Plug 'hrsh7th/nvim-compe'                        " Neovim lsp autocomplete
    Plug 'nvim-lua/popup.nvim'                       " Neovim popups ported from vim
    Plug 'nvim-lua/plenary.nvim'                     " Neovim asynch coroutines for lua
    Plug 'nvim-telescope/telescope.nvim'             " Neovim extendable fuzzy finder
    Plug 'junegunn/fzf', {'do': {-> fzf#install()}}  " Fuzzy finder
    Plug 'junegunn/fzf.vim'                          " Fuzzy finder
endif

call plug#end()

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

" Early exit for standard config
if config_level < 2
	finish
endif

"----------------------Level 2------------------------------"

" lsp
lua << EOF
    require'lspconfig'.clangd.setup{}
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()<CR>

" Autocomplete
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Completion tabs
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Telescope
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" FZF
nnoremap <leader>ff <cmd>Files<cr>
