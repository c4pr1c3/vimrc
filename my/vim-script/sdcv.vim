if executable('sdcv')
function! Mydict()
	if s:w_mywin
		let s:w_mywin=0
		set nu!
		close
		file
		return
	endif
	let s:w_mywin=1
	let expl=system('sdcv --data-dir ~/.stardict -n -0 ' .
				\  expand("<cword>"))
	windo if
				\ expand("%")=="diCt-tmp" |
				\ q!|endif
	botright vertical 50split diCt-tmp
	setlocal buftype=nofile bufhidden=hide noswapfile
	set nu!
	1s/^/\=expl/
	1
endfunction
" 使用F查询光标所在处的单词的中文
nmap  F  :call  Mydict()<cr>
endif " if executable('sdcv')
