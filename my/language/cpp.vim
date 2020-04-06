"""""""""""""""""""""""""""""""""""""""""""""""""CPP
autocmd FileType cpp  call CPP()
fun! CPP()
    set cindent
    set comments=sr:/*,mb:*,el:*/,://
    set commentstring=\ \ //\ %s\  " <SPACE>
    set foldcolumn=3
    set expandtab
    set tags+=/usr/include/tags
    " control-c comments block
    vmap <C-C> :s/^/\/\//g<enter>
    " control-x uncomments block
    vmap <C-X> :s/^\/\///g<enter>
    "     execute ":set dictionary=C:\\dict\\CPP"
endfun " endfun CPP


