"set new file extension jsm as javascript file.
au BufNewFile,BufRead *.jsm set filetype=javascript
"""""""""""""""""""""""""""""""""""""""""""""""""JS
autocmd Filetype javascript call JS()
fun! JS()
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    "   cs add /home/caprice/NetBeansProjects/SQLInjectMe/cscope.out

    " vim-nodejs-complete plugin settings
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

    let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'

    " 打开javascript折叠 
    let b:javascript_fold=1 
    " 打开javascript对dom、html和css的支持 
    let javascript_enable_domhtmlcss=1

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
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

endfun " endfun JS


