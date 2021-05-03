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

" -------------------- Plugins --------------------------- "

if config_level >= 1
    call plug#begin(stdpath('data').'/plugged')

    Plug 'preservim/nerdtree'     " File Tree
    Plug 'godlygeek/tabular'      " Tabulation
    Plug 'flazz/vim-colorschemes' " Colourschemes
    Plug 'sheerun/vim-polyglot'   " Language packs
    Plug 'itchyny/lightline.vim'  " Pretty status bar
    Plug 'jiangmiao/auto-pairs'   " Auto insert brackets
endif

if config_level >= 2
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF Fuzzy finder
    Plug 'junegunn/fzf.vim'                             " Fzf for vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocompletion
endif

if config_level > 0
    call plug#end()
endif

"---------------------- Configs --------------------------"

if config_level >= 0
    " Minimal configuration with zero dependencies
    execute 'source '.stdpath('config').'/0_basic.vim'
endif

if config_level >= 1
    " Standard plugins with few dependencies
    execute 'source '.stdpath('config').'/1_standard.vim'
endif

if config_level >= 2
    " Powerful plugins with many dependencies
    execute 'source '.stdpath('config').'/2_advanced.vim'
endif

