if has_key(g:plugs, 'YouCompleteMe')
" YouCompleteMe配置
" let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
if g:uname == "Darwin"
    let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
    if isdirectory(s:clang_library_path)
        let g:clang_library_path=s:clang_library_path
    endif
endif
let g:ycm_extra_conf_globlist = ['~/.vim/plugged/YouCompleteMe/cpp/ycm/*','!~/*']
" https://github.com/Valloric/YouCompleteMe#mac-os-x
let g:ycm_python_interpreter_path = '~/.pyenv/shims/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_filetype_specific_completion_to_disable = {
            \ 'gitcommit': 1,
            \ 'markdown': 1
            \}
endif

