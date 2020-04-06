"""""""""""""""""""""""""""""""""""""""""""""""""PERL
autocmd FileType perl call PERL()
fun! PERL()
    " replace the default perl debugger to ptkdb
    " ref: http://lug.fh-swf.de/vim/vim-doc/perlsupport.html#perlsupport-run-debug
    "g:Perl_Debugger=ptkdb
    set cindent
    set commentstring=\ \ #\ %s\  " <SPACE>
    set foldcolumn=3
    "set keywordprg="perldoc"
    " control-c comments block
    vmap <C-C> :s/^/#/g<enter>
    " control-x uncomments block
    vmap <C-X> :s/^#//g<enter>
    " ----------22:34 2007-01-04 update this-----------------------------
    " -----F4 查字典 F7 单步调试 F8 语法检查 F9 运行程序-------
    " -----;a 自动完成-----

    "<C-K> == see perldoc for current word under cursor
    nmap <C-K> :call PerlDoc(expand("<cword>"))<CR>

    "<F7> for perl debugging
    map <F7> :w<CR>:!perl -wd:ptkdb "%"<CR>
    "<F8> for perl syntax checking (autosave first)
    map <F8> :w<CR>:!perl -wc "%"<CR>
    "<F9> to run by perl (autosave first) "",'' are both ok
    map <F9> :w<CR>:!perl "%"<CR>

    " set dictionary for perl keywords completion
    " set dictionary=C:\\dict\\PERL

    "set autoindent depth
    set shiftwidth=4
    "set tabstop
    set tabstop=4
    "set showmatch
    set showmatch

    " mapping my insert commands
    " I called them ";-command" 'cause you've the least hesitation
    " between you type the ";" and the following <Space> or <CR>

    "<;a> for Auto-completion using dictionary
    imap ;a <C-X><C-K>
    "then use <C-N> to match the next keywords, and <C-P> the previous one
    " map!=imap+cmap (i=insert mode, c=:command mode)
    " a) imap <Space><Space> xx also can work, but not good
    " b) i cannot map <M-x> or <M-Space>, why?
    " c) Ctrl-Space <=> Ctrl-@
endfun " endfun PERL

func PerlDoc(keyword)
    if a:keyword=~"::"
        "module name;
        exec ':!perldoc '.a:keyword
    elseif a:keyword=~"^perl"
        "perl pod
        exec ':!perldoc '.a:keyword
    else
        "perl function
        exec ':!perldoc -f '.a:keyword
    endif
endfunc
