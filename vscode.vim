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
nnoremap <leader>rc :e $MYVIMRC<CR>

" Move between windows
nnoremap <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Move between tabs
nnoremap <leader>[ :call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <leader>] :call VSCodeNotify('workbench.action.nextEditor')<CR>

" Goto file explorer
nnoremap <leader>n :call VSCodeNotify('workbench.view.explorer')<CR>

" Resize window (Slow for some reason)
nnoremap <silent>- :call VSCodeNotify('workbench.action.increaseViewSize')<CR>
nnoremap <silent>= :call VSCodeNotify('workbench.action.decreaseViewSize')<CR>

" Type information
nnoremap <silent>gd :call VSCodeCall('editor.action.revealDefinition')<CR> 
nnoremap <silent>gr :call VSCodeCall('editor.action.goToReferences')<CR> 
nnoremap <silent>K :call VSCodeCall('editor.action.peekTypeDefinition')<CR> 