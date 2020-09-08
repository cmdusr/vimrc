let CONFIG_PATH=stdpath('config')

if !exists('g:vscode')
	let $MYVIMRC=CONFIG_PATH .'/standard.vim'
	execute 'source '.fnameescape($MYVIMRC)
else
	let $MYVIMRC=CONFIG_PATH .'/vscode.vim'
	execute 'source '.fnameescape($MYVIMRC)
endif
