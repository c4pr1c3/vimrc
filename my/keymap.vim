" 解决超长行移动的困难
" 重新定义<UP> <DOWN> 
nmap <UP> gk
imap <UP> <ESC>gka

nmap <DOWN> gj
imap <DOWN> <ESC>gja

" for quick save in normal mode
map <silent> <F2> :write<CR>

if has_key(g:plugs, 'nerdtree')
map <silent> <F3> :NERDTree<CR>
endif

if has_key(g:plugs, 'nerdtree')
nnoremap <silent> <F4> :Tlist<CR>
endif

" let F5 insert current time to current location.
map <F5> i<C-R>=strftime("%H:%M %Y-%m-%d")<ESC><ESC>

" Let F8 made dictionary automatically complete keywords.
map! <F8> <C-X><C-K>

" switch between windows
map <silent> <F12> <C-W>w
"
" for quick save in edit mode
imap <F2> <ESC><F2>a

" Don't use Ex mode, use Q for formatting
map Q gq

if executable('DashSearch')
" integrate dash.app into vim
    let g:dash_map = { 'bash' : 'sh', 'php' : 'php', 'c' : 'c', 'vim' : 'vim', 'css' : 'css', 'javascrip' : 'javascript', 'sql' : 'mysql' }
    " 使用Dash.app查询光标所在处的关键词
    nmap <silent> <leader>d <Plug>DashSearch
endif
if executable('DashGlobalSearch')
    nmap <silent> <leader>D <Plug>DashGlobalSearch
endif
