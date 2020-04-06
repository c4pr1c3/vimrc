" change tabstop to space stop and set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 设置高亮当前行
set cursorline

" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
set laststatus=2 " 永远显示状态栏
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:Powerline_symbols = 'fancy'

set display=lastline
set number

set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands

let g:molokai_original = 1
"colorscheme monokai
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
  set ttimeoutlen=10
  augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
  augroup END
endif
