" add by huangwei 2009-03-11
" use both cscope and ctag for 'ctrl-]', and 'vim -t'
set cscopetag
" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order
set csto=1
if has("cscope")

    if g:uname == "Darwin"
        set csprg=/usr/local/bin/cscope
    else
        set csprg=cscope
    endif
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out ./
    endif
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out ./
    endif
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
set cscopeverbose

set cscopequickfix=s-,c-,d-,i-,t-,e-
