let CONFIG_PATH=stdpath('config')

if !exists('g:vscode')
	let $MYVIMRC=stdpath('config') .'/standard.vim'
	execute 'source '.fnameescape($MYVIMRC)
else
	let $MYVIMRC=stdpath('config') .'/vscode.vim'
	execute 'source '.fnameescape($MYVIMRC)
endif
