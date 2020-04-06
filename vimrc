" An modularized vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change: 2002 May 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"       for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"     for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" 环境变量定义
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

" mac vim only
if has("unix")
  let g:uname = system("uname -s | tr -d '\n'")
  if g:uname == "Darwin"
    " Do Mac stuff here
  endif
  if g:uname == "Linux"
    " Do Linux stuff here
  endif
endif

set nocompatible               " be iMproved
filetype off                   " Vundle config required!

" Only do this part when compiled with support for autocommands.
if has("autocmd")
" ref: https://unix.stackexchange.com/questions/171132/can-vimrc-be-divided-into-multiple-files
runtime my/vim-plug.vim

" vim settings
runtime my/ui.vim
runtime my/keymap.vim
runtime my/misc.vim

" vim-script (new functions)
runtime my/vim-script/sdcv.vim
runtime my/vim-script/hexmode.vim
runtime my/vim-script/set-color-coloum.vim

" plugin settings
runtime my/plugin/asyncrun.vim
runtime my/plugin/gundo.vim
runtime my/plugin/vcscommand.vim
runtime my/plugin/load_template.vim
runtime my/plugin/taglist.vim
runtime my/plugin/youcompleteme.vim
runtime my/plugin/vimwiki.vim
runtime my/plugin/leaderf.vim
runtime my/plugin/quickui.vim
runtime my/plugin/nerdtree.vim
runtime my/plugin/vim-indent-guides.vim

" programming language settings
runtime my/language/markdown.vim
runtime my/language/bash.vim
runtime my/language/python.vim
runtime my/language/javascript.vim
runtime my/language/c.vim
runtime my/language/cpp.vim
runtime my/language/html.vim
runtime my/language/perl.vim
runtime my/language/php.vim
runtime my/language/java.vim
runtime my/language/xul.vim

endif " has("autocmd")

