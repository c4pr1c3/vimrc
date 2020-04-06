if has_key(g:plugs, 'gundo')
    " 利用撤销历史构建undo tree，实现每次修改文件保存后在本地可以方便的进行线性版本管理
    " https://github.com/sjl/gundo.vim
    " GundoShow && GundoHide
    let g:gundo_preview_bottom=1
    " ref: https://github.com/sjl/gundo.vim/pull/35
    let g:gundo_prefer_python3 = 1
endif

