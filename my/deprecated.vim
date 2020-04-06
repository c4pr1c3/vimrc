" 设置状态栏提示信息
"set statusline=%<%f%h%m%r%=%{&ff}\ %l,%c%V\ %P
"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set statusline+=%{FugitiveStatusline()} " get an indicator with the current branch

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

"###################################################################
"@author -  huangwei
"@created on -  2005-10-20
"@last modified -16:34 2013-05-01 
"-------------------------------------------------------------------
" F2 - write file without confirmation
" F3 - call file explorer Ex
" F4 - show Taglist
" F5 - automatically insert current time to current location 
" F8 - automatically complete keywords
" F12 - switch between windows 
"------------------------------------------------------------------- 
"map <S-Tab> :call NextField(' \{2,}',2,' ',0)<CR>
"map! <S-Tab> <C-O>:call NextField(' \{2,}',2,' ',0)<CR>

" 拼写检查
" setlocal spell spelllang=en_us

" function: NextField
" Args: fieldsep,minlensep,padstr,offset
"
" NextField checks the line above for field separators and moves the cursor on
" the current line to the next field. The default field separator is two or more
" spaces. NextField also needs the minimum length of the field separator,
" which is two in this case. If NextField is called on the first line or on a
" line that does not have any field separators above it the function echoes an
" error message and does nothing.
" func! NextField(fieldsep,minlensep,padstr,offset)
"     let curposn = col(".")
"     let linenum = line(".")
"     let prevline = getline(linenum-1)
"     let curline = getline(linenum)
"     let nextposn = matchend(prevline,a:fieldsep,curposn-a:minlensep)+1
"     let padding = ""
" 
"     if nextposn > strlen(prevline) || linenum == 1 || nextposn == 0
"         echo "last field or no fields on line above"
"         return
"     endif
" 
"     echo ""
" 
"     if nextposn > strlen(curline)
"         if &modifiable == 0
"             return
"         endif
"         let i = strlen(curline)
"         while i < nextposn - 1
"             let i = i + 1
"             let padding = padding . a:padstr
"         endwhile
"         call setline(linenum,substitute(curline,"$",padding,""))
"     endif
"     call cursor(linenum,nextposn+a:offset)
"     return
" endfunc

" ref: http://vim.wikia.com/wiki/Make_views_automatic
" 自动保存和加载当前文件的代码折叠状态
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview


