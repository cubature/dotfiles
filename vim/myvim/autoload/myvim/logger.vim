function! myvim#logger#debug(msg) abort
	echo "debug: " . a:msg
endfunction

function! myvim#logger#info(msg) abort
	echo "info: " . a:msg
endfunction

function! myvim#logger#warn(msg) abort
	echo "warn: " . a:msg
endfunction

function! myvim#logger#error(msg) abort
	echo "error: " . a:msg
endfunction
