"888b    888                  888     888 d8b
"8888b   888                  888     888 Y8P
"88888b  888                  888     888
"888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.
"888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888  888  88b
"888  Y88888 88888888 888  888  Y88o88P   888 888  888  888
"888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888
"888    Y888   Y8888    Y88P"     Y8P     888 888  888  888
"----------------------Main Config-------------------------"

let config_level=1

" Level 0: Minimal  config with zero dependencies (No    plugins)
" Level 1: Standard config with few  dependencies (Small plugins)
" Level 2: Powerful config with many dependencies (Large plugins)

" Always include Level 0 minimal config
execute 'source '.stdpath('config').'/0_basic.vim'

if config_level == 0
	" Early exit for minimal config
	finish
endif

"----------------------Plug---------------------------------"

" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

"----------------------Plugins-----------------------------"

Plug 'preservim/nerdtree'     " File Tree
Plug 'godlygeek/tabular'      " Tabulation
Plug 'flazz/vim-colorschemes' " Colourschemes
Plug 'sheerun/vim-polyglot'   " Language packs
Plug 'itchyny/lightline.vim'  " Pretty status bar
Plug 'jiangmiao/auto-pairs'   " Auto insert brackets

if config_level >= 2
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF Fuzzy finder
    Plug 'junegunn/fzf.vim'                             " Fzf for vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocompletion
endif

call plug#end()

"----------------------Final Config------------------------"

" Level 1 config
execute 'source '.stdpath('config').'/1_standard.vim'

if config_level >= 2
	" Level 2 config
    execute 'source '.stdpath('config').'/2_advanced.vim'
endif
