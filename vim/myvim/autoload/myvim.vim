scriptencoding utf-8

function! myvim#init() abort
	" show line number
	set number

	" indent
	let &tabstop = 2
	let &softtabstop = 2
	let &shiftwidth = 2
endfunction
