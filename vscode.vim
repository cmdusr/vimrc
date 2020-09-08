"888b    888                  888     888 d8b
"8888b   888                  888     888 Y8P
"88888b  888                  888     888
"888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.
"888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888  888  88b
"888  Y88888 88888888 888  888  Y88o88P   888 888  888  888
"888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888
"888    Y888   Y8888    Y88P"     Y8P     888 888  888  888

"----------------------General Config----------------------"

" Map leader to space
let mapleader= " "

" Edit init.vim
map <leader>rc :e $MYVIMRC<CR>

" Move between windows
map <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
map <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
map <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
map <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Move between tabs
map <leader>[ :call VSCodeNotify('workbench.action.previousEditor')<CR>
map <leader>] :call VSCodeNotify('workbench.action.nextEditor')<CR>

" Open nerdtree centered on current file
nnoremap <leader>n :NERDTreeToggle<Enter>

map - :call VSCodeNotify('workbench.action.increaseViewSize')<CR>
map = :call VSCodeNotify('workbench.action.decreaseViewSize')<CR>