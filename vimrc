"-----Required to use Vundle-----"
set nocompatible							" Turn off compatibility with vi, use vim
filetype off								" Turn off filetype detection
set rtp+=~/.vim/bundle/Vundle.vim			" Set the runtime path to use vundle
call vundle#begin()							" Initialise plugins
Plugin 'VundleVim/Vundle.vim'				" Must use vundle plugin
"-----Required to use Vundle-----"

"-----Plugins must be added here-----"
Plugin 'Valloric/YouCompleteMe'				" Autocompletion engine
Plugin 'rdnetto/YCM-Generator'				" Generated configs for YCM
Plugin 'flazz/vim-colorschemes'				" Vim colourschemes
Plugin 'octol/vim-cpp-enhanced-highlight'	" Better c++ syntax highlighting
"Plugin 'dusans/vim-hardmode'				" Disables simple vim forcing more efficiant useage
"-----Plugins must be added here-----"

"-----Required to use Vundle-----"
call vundle#end()							" End plugin initilisation
filetype plugin indent on					" ???
"-----Required to use Vundle-----"

"-----General Settings-----"
" Editing
set tabstop=4								" Visual size of tab in terms of spaces
set softtabstop=4							" Size of inserted tabs in terms of spaces
set shiftwidth=4							" Amount of indentation in terms of spaces
set clipboard=unnamed						" Make vim copy to clipboard

" Ui
set number									" Display line numbers
set showmatch								" Highlight matching brackets [({})]
if $COLORTERM == 'gnome-terminal'			" Use 256 colours
	set t_Co=256
endif
colorscheme leo								" Set colourscheme
"-----General settings-----"

"-----You complete me-----"
" Custom bindings
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'	" Global config file
let g:ycm_confirm_extra_conf = 0								" ???
let g:syntastic_always_populate_loc_list = 1					" ???
let g:ycm_collect_identifiers_from_tags_files = 1				" ???
set tags+=./.tags												" ???
let g:ycm_autoclose_preview_window_after_insertion = 1			" ???
let g:ycm_seed_identifiers_with_syntax = 1
"-----You complete me-----"

" Enhanced highlight settings"
let g:cpp_class_scope_highlight = 1								" Highlight c++ class scope
let g:cpp_member_variable_highlight = 1							" Highlight c++ member variables
let g:cpp_class_decl_highlight = 1								" Highlight c++ class declaration
let g:cpp_experimental_template_highlight = 1					" Highlight c++ templates
let g:cpp_concepts_highlight = 1								" Highlight c++ library concepts
