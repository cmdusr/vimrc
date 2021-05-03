" -------------------- Colourschemes -------------------- "
colorscheme leo

" -------------------- Nerd Tree ------------------------ "
let NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1

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

