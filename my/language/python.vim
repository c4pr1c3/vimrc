"""""""""""""""""""""""""""""""""""""""""""""""""PYTHON
autocmd FileType python call PYTHON()
fun! PYTHON()
    " ref: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
    " Enable folding
    set foldmethod=indent
    set foldlevel=99
    " Enable folding with the spacebar
    nnoremap <space> za
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    set fileformat=unix
    set commentstring=\ \ #\ %s\  " <SPACE>
    set foldcolumn=3
    set keywordprg="pydoc"
    if g:uname == "Linux"
        " Do Linux stuff here
        let $PYTHONPATH='/usr/share/pyshared'
    endif

    " syntastic的python语法插件定义
    let g:syntastic_python_checkers=['flake8']
    " E501 line too long ( > 79 characters )
    let g:syntastic_python_flake8_args = "--ignore=E501"
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let python_highlight_all=1

    " AsyncRun -raw python need this setting
    let $PYTHONUNBUFFERED=1
    noremap <F9> :AsyncRun -raw=1 python "%"<cr>

    "<C-K> == see pydoc for current word under cursor
    nmap <C-K> :call PyDoc(expand("<cword>"))<CR>
    " control-c comments block
    vmap <C-C> :s/^/#/g<enter>
    " control-x uncomments block
    vmap <C-X> :s/^#//g<enter>

    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    " setlocal omnifunc=jedi#completions

    func! PyDoc(keyword)
        exec ':!pydoc '.a:keyword
    endfunc " PyDoc
endfun " endfun PYTHON


