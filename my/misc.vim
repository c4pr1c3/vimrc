" 设置自动刷新缓存，当需要重新读取缓存时只需要执行:checktime
set autoread

" 搜索时忽略大小写
set ignorecase

" vim 7.3新特性：持久撤销 配置
" 重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir " 必须手工预先创建，vim不会自动帮你创建
set undolevels=1000 "maximum number of changes that can be undone

set encoding=utf8
let &termencoding=&encoding
set fileencodings=utf8,gbk,ucs-bom,cp936
set linebreak
let s:w_mywin=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50  " keep 50 lines of command line history
set incsearch  " do incremental searching

"mouse function support
set mouse=a

" disable auto backup
set nobackup

" set root directory of DICTIONARY, whose value by default is
" NULL to Linux
" /cygdrive/c to cygwin
" C: to Win32
" let g:DIC_ROOT_DIR="C:\\dict"
"
" set default 'dictionary' path
" execute ":set dictionary+=".g:DIC_ROOT_DIR."\\words"
" more and more place including such keyword
set iskeyword+=-

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
