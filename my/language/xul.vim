""""""""""""""""""""""""""""""""""""""""""""""""""*
" autocmd FileType *      set comments&
""""""""""""""""""""""""""""""""""""""""""""""""""C
autocmd FileType xul call XUL()
fun! XUL()
   
   set tags+=/usr/include/tags,/usr/local/include/tags
   set path+=/usr/local/include

"   cs add /home/caprice/NetBeansProjects/SQLInjectMe/cscope.out

   "查找当前选中的C符号（函数名、宏、结构体、变量名等）
   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   
   "查找定义
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   
   "查找调用本函数的所有函数
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   
   "查找本函数调用的所有函数
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的字符串
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   
   "查找egrep模式字符串
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的文件名
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

   "查找包含当前文件的所有文件
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
endfun " endfun XUL


