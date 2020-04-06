autocmd FileType sh call BASH()
fun! BASH()
    " change tabstop to space stop and set shiftwidth=4
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
    noremap <F9> :AsyncRun bash "%"<cr>
endfun
