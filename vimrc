" An example for a vimrc file.
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
" integrate dash.app into vim
    let g:dash_map = { 'bash' : 'sh', 'php' : 'php', 'c' : 'c', 'vim' : 'vim', 'css' : 'css', 'javascrip' : 'javascript', 'sql' : 'mysql' }
  endif
endif

" ref: http://vim.wikia.com/wiki/Make_views_automatic
" 自动保存和加载当前文件的代码折叠状态
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" 使用Dash.app查询光标所在处的关键词
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

" 使用F查询光标所在处的单词的中文
nmap  F  :call  Mydict()<cr>


set nocompatible               " be iMproved
filetype off                   " Vundle config required!

" Initialize vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if v:shell_error
    " just in case of github access failure
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://gitee.com/c4pr1c3/vim-plug/raw/master/plug.vim
    if v:shell_error
      exit
    else
      silent !touch ~/.vim/autoload/plug.vim.ready
    endif
  else
    silent !touch ~/.vim/autoload/plug.vim.ready
  endif
endif

if !empty(glob('~/.vim/autoload/plug.vim.ready'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    if !v:shell_error
      silent !rm -f "$HOME/.vim/autoload/plug.vim.ready"
    endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'gmarik/vundle'

" My Plugs here:
" original repos on github
Plug 'mattn/calendar-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular'
Plug 'tomtom/tlib_vim' 
Plug 'chrisbra/unicode.vim' 
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'
Plug 'myhere/vim-nodejs-complete'
Plug 'rodjek/vim-puppet'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-dispatch'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'powerline/powerline'
Plug 'bling/vim-airline'
Plug 'rizzatti/dash.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'

" themes
Plug 'tomasr/molokai'

" vim-scripts repos
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/ditaa'
Plug 'vim-scripts/load_template'
Plug 'vim-scripts/perl-support.vim'
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/vcscommand.vim'

" Bro
Plug 'mephux/bro.vim'

" vim-markdown-toc
Plug 'mzlogin/vim-markdown-toc'

" https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'

" https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'

" https://github.com/rhysd/vim-grammarous
" Plug 'rhysd/vim-grammarous'

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Plug 'tweekmonster/django-plus'

" Align GitHub-Flavored Markdown Tables in Vim
Plug 'junegunn/vim-easy-align'

" Always load the vim-devicons as the very last one.
"Plug 'ryanoasis/vim-devicons'

" Vim 8.2+ only!!!
Plug 'skywind3000/vim-quickui'

" vim 8.1.1615+ only!!!
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Initialize plugin system
call plug#end()

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"filetype plugin indent on     " Vundle config required!


" change tabstop to space stop and set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 设置自动刷新缓存，当需要重新读取缓存时只需要执行:checktime
set autoread

" 搜索时忽略大小写
set ignorecase

" 设置高亮当前行
set cursorline

" 设置状态栏提示信息
"set statusline=%<%f%h%m%r%=%{&ff}\ %l,%c%V\ %P
"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set statusline+=%{FugitiveStatusline()} " get an indicator with the current branch

" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
set laststatus=2 " 永远显示状态栏
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:Powerline_symbols = 'fancy'

"vimwiki
" https://superuser.com/questions/495889/have-vimwiki-set-filetype-only-within-wikihome
let g:vimwiki_global_ext = 0
let g:tagbar_type_vimwiki = {
            \ 'ctagstype' : 'vimwiki',
            \ 'kinds'     : [
            \ 'h:header',
            \ ],
            \ 'sort'    : 0
            \ }
let g:vimwiki_use_mouse=1
let g:vimwiki_list = [
            \ {'path': $PKW_HOME."/md_vimwiki",
			\ 'path_html': $PKW_HOME."/md_vimwiki_html/",
			\ 'template_path': $PKW_HOME."/template/",
			\ 'template_default': 'default_template',
			\ 'template_ext': '.tpl',
			\ 'diary_rel_path': '/',
			\ 'diary_index': 'diary',
            \ 'syntax': 'markdown', 'ext': '.mkd'},
            \ {'path': $PKW_HOME."/vimwiki",
			\ 'path_html': $PKW_HOME."/vimwiki_html/",
			\ 'template_path': $PKW_HOME."/template/",
			\ 'template_default': 'default_template',
			\ 'template_ext': '.tpl',
			\ 'diary_rel_path': '/',
			\ 'diary_index': 'diary'},
            \ {'path': $PKW_HOME."/teaching_wiki",
			\ 'path_html': $PKW_HOME."/teachingwiki_html/",
			\ 'template_path': $PKW_HOME."/template/",
			\ 'template_default': 'teaching_template',
			\ 'template_ext': '.tpl',
			\ 'diary_rel_path': '/',
			\ 'diary_index': 'diary'},
            \ {'path': $PKW_HOME."/public_wiki",
			\ 'path_html': $PKW_HOME."/public_wiki_html/",
			\ 'template_path': $PKW_HOME."/public_template/",
			\ 'template_default': 'default_public_template',
			\ 'template_ext': '.tpl',
			\ 'diary_rel_path': '/',
			\ 'diary_index': 'diary'},
            \ {'path': $PKW_HOME."/lab_wiki",
			\ 'path_html': $PKW_HOME."/lab_wiki_html/",
			\ 'template_path': $PKW_HOME."/template/",
			\ 'template_default': 'default_lab_template',
			\ 'template_ext': '.tpl',
			\ 'diary_rel_path': '/',
			\ 'diary_index': 'diary'}]
let g:vimwiki_file_exts = 'c, cpp, wav, txt, h, hpp, zip, sh, awk, ps, pdf, flv, 7z, htm, swf, doc, docx, ppt, pptx'
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kdb,del,br,hr,div,code,h1,script,a,p,blockquote,font'
let g:vimwiki_camel_case = 0
let g:vimwiki_listsyms = '✗○◐●✓'

:let g:asyncrun_open = 8

" https://mkaz.github.io/working-with-vim/vimwiki.html
" 添加自定义命令 :Diary
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" mattn/calendar-vim settings
let g:calendar_diary=$PKW_HOME."/md_vimwiki"
let g:calendar_filetype = 'markdown'


"ctags for vimwiki
let tlist_vimwiki_settings = 'vimwiki;h:Headers'

" vcscommand
let VCSCommandSVNExec='/usr/local/bin/svn'

" vim 7.3新特性：持久撤销 配置
" 重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir " 必须手工预先创建，vim不会自动帮你创建
set undolevels=1000 "maximum number of changes that can be undone

" 利用撤销历史构建undo tree，实现每次修改文件保存后在本地可以方便的进行线性版本管理
" https://github.com/sjl/gundo.vim
" GundoShow && GundoHide
let g:gundo_preview_bottom=1
" ref: https://github.com/sjl/gundo.vim/pull/35
let g:gundo_prefer_python3 = 1

set encoding=utf8
let &termencoding=&encoding
set fileencodings=utf8,gbk,ucs-bom,cp936
" 拼写检查
" setlocal spell spelllang=en_us
set linebreak
let s:w_mywin=0

"set new file extension jsm as javascript file.
au BufNewFile,BufRead *.jsm set filetype=javascript

" load_template plugin config
let g:template_path = '$HOME/.vim/template/'

function! Mydict()
	if s:w_mywin
		let s:w_mywin=0
		set nu!
		close
		file
		return
	endif
	let s:w_mywin=1
	let expl=system('sdcv --data-dir ~/.stardict -n -0 ' .
				\  expand("<cword>"))
	windo if
				\ expand("%")=="diCt.css" |
				\ q!|endif
	botright vertical 50split diCt.css
	setlocal buftype=nofile bufhidden=hide noswapfile
	set nu!
	1s/^/\=expl/
	1
endfunction
" 使用F查询光标所在处的单词的中文
nmap  F  :call  Mydict()<cr>

set display=lastline
" 解决超长行移动的困难
" 重新定义<UP> <DOWN> 
:nmap <UP> gk
:imap <UP> <ESC>gka

:nmap <DOWN> gj
:imap <DOWN> <ESC>gja

let g:molokai_original = 1
"colorscheme monokai
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai

" add by huangwei 2009-03-11
" use both cscope and ctag for 'ctrl-]', and 'vim -t'
set cscopetag
" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order
set csto=1
if has("cscope")

    if g:uname == "Darwin"
        set csprg=/usr/local/bin/cscope
    else
        set csprg=cscope
    endif
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out ./
    endif
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out ./
    endif
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
set cscopeverbose

set cscopequickfix=s-,c-,d-,i-,t-,e-
set number

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50  " keep 50 lines of command line history
set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands
set incsearch  " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

"###################################################################
"@author -  huangwei
"@created on -  2005-10-20
"@last modified -16:34 2013-05-01 
"-------------------------------------------------------------------
" F2 - write file without confirmation
" F3 - call file explorer Ex
" F4 - show Taglist
" F5 - automatically insert current time to current location 
" F8 - automatically complete keywords
" F12 - switch between windows 
"------------------------------------------------------------------- 
"map <S-Tab> :call NextField(' \{2,}',2,' ',0)<CR>
"map! <S-Tab> <C-O>:call NextField(' \{2,}',2,' ',0)<CR>
" function: NextField
" Args: fieldsep,minlensep,padstr,offset
"
" NextField checks the line above for field separators and moves the cursor on
" the current line to the next field. The default field separator is two or more
" spaces. NextField also needs the minimum length of the field separator,
" which is two in this case. If NextField is called on the first line or on a
" line that does not have any field separators above it the function echoes an
" error message and does nothing.

func! NextField(fieldsep,minlensep,padstr,offset)
    let curposn = col(".")
    let linenum = line(".")
    let prevline = getline(linenum-1)
    let curline = getline(linenum)
    let nextposn = matchend(prevline,a:fieldsep,curposn-a:minlensep)+1
    let padding = ""

    if nextposn > strlen(prevline) || linenum == 1 || nextposn == 0
        echo "last field or no fields on line above"
        return
    endif

    echo ""

    if nextposn > strlen(curline)
        if &modifiable == 0
            return
        endif
        let i = strlen(curline)
        while i < nextposn - 1
            let i = i + 1
            let padding = padding . a:padstr
        endwhile
        call setline(linenum,substitute(curline,"$",padding,""))
    endif
    call cursor(linenum,nextposn+a:offset)
    return
endfunc

" for quick save in normal mode
map <silent> <F2> :write<CR>
map <silent> <F3> :NERDTree<CR>

" switch between windows
map <silent> <F12> <C-W>w
"
" for quick save in edit mode
imap <F2> <ESC><F2>a

" according to SMTH's VIM board
nnoremap <silent> <F4> :Tlist<CR>
" open Tlist at the rightmost place
let g:Tlist_Use_Right_Window=1

" let F5 insert current time to current location.
map <F5> i<C-R>=strftime("%H:%M %Y-%m-%d")<ESC><ESC>
" map! <F5> <C-R>=strftime("%H:%M %Y-%m-%d")<RETURN>

"mouse function support
set mouse=a

" set auto shift width
" set shiftwidth=4

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
" Let F8 made dictionary automatically complete keywords.
map! <F8> <C-X><C-K>


"autocmd FileType sql call SQL()
"fun! SQL()
"let g:tlist_sql_settings='sql;t:table'
"endfunc " end of func SQL

autocmd FileType sh call BASH()
fun! BASH()
" change tabstop to space stop and set shiftwidth=4
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
noremap <F9> :AsyncRun bash "%"<cr>
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""*
" autocmd FileType *      set comments&
""""""""""""""""""""""""""""""""""""""""""""""""""C
autocmd FileType xul call XUL()
fun! XUL()
   
   set tags+=/usr/include/tags,/usr/local/include/tags
   set path+=/usr/local/include

"   cs add /home/caprice/NetBeansProjects/SQLInjectMe/cscope.out

   "查找当前选中的C符号（函数名、宏、结构体、变量名等）
   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   
   "查找定义
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   
   "查找调用本函数的所有函数
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   
   "查找本函数调用的所有函数
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的字符串
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   
   "查找egrep模式字符串
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的文件名
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

   "查找包含当前文件的所有文件
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
endfun " endfun XUL


autocmd FileType c,cpp call C()
  fun! C()
   set cindent
   set comments=sr:/*,mb:*,el:*/,://
   set commentstring=\ \ //\ %s\  " <SPACE>
   set foldcolumn=3
   set expandtab
   set tabstop=4
   set softtabstop=4
   set shiftwidth=4
   set tags+=/usr/include/tags,/usr/local/include/tags
   set path+=/usr/include,/usr/local/include
   let g:vimgdb_debug_file = ""
   
   "查找当前选中的C符号（函数名、宏、结构体、变量名等）
   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   
   "查找定义
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   
   "查找调用本函数的所有函数
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   
   "查找本函数调用的所有函数
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的字符串
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   
   "查找egrep模式字符串
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的文件名
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

   "查找包含当前文件的所有文件
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>

   run macros/gdb_mappings.vim
   "execute ":set dictionary=C:\\dict\\C"
   " control-c comments block
   vmap <C-C> :s/^/\/\//g<enter>
   " control-x uncomments block
   vmap <C-X> :s/^\/\///g<enter>
   map! =for for(i = 0; i < ; i++){<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  endfun " endfun C

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

"""""""""""""""""""""""""""""""""""""""""""""""""HTML
  autocmd FileType html call HTML()
    fun! HTML()
	set expandtab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
    endfun " endfun HTML
"""""""""""""""""""""""""""""""""""""""""""""""""JAVA
  autocmd FileType java call JAVA()
    fun! JAVA()
     set cindent
     set commentstring=\ \ //\ %s\  " <SPACE>
     set foldcolumn=3
     set expandtab 
"     tags+=${JAVA_HOME}/src/tags
     " control-c comments block
     vmap <C-C> :s/^/\/\//g<enter>
     " control-x uncomments block
     vmap <C-X> :s/^\/\///g<enter>
     " execute ":set dictionary=C:\\dict\\JAVA"
     map! =for for(int i = 0; i < ; i++){<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
     map! =psvm public static void main(String [] args){<RETURN>
     map! =soutn System.out.println(
     map! =sout System.out.print(
     map! =try try{<RETURN>}catch(Exception e){<RETURN>System.out.println(e.getMessage());<RETURN>}<ESC>kkko
     map! =tryb try{<ESC>:/^[ \t]*$/<RETURN>ddko}catch(Exception e){<RETURN>System.out.println(e.getMessage());<RETURN>}<ESC>k
   endfun " endfun JAVA

"""""""""""""""""""""""""""""""""""""""""""""""""JSP
  autocmd FileType jsp call JSP()
    fun! JSP()
	 " execute ":set dictionary=C:\\dict\\JSP"
    endfun " endfun JSP

"""""""""""""""""""""""""""""""""""""""""""""""""JS
  autocmd Filetype javascript call JS()
    fun! JS()
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
"   cs add /home/caprice/NetBeansProjects/SQLInjectMe/cscope.out

" vim-nodejs-complete plugin settings
" automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

    let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'

    " 打开javascript折叠 
    let b:javascript_fold=1 
    " 打开javascript对dom、html和css的支持 
    let javascript_enable_domhtmlcss=1

   "查找当前选中的C符号（函数名、宏、结构体、变量名等）
   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   
   "查找定义
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   
   "查找调用本函数的所有函数
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   
   "查找本函数调用的所有函数
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的字符串
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   
   "查找egrep模式字符串
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的文件名
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

   "查找包含当前文件的所有文件
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

    endfun " endfun JS

"""""""""""""""""""""""""""""""""""""""""""""""""PHP
  autocmd FileType php call PHP()
    fun! PHP()
"	add the path of php manual to $VIMRUNTIME/doc
"	refs to: http://www.fumbling-in-the-dark.com/2011/03/viewing-php-manual-in-vim.html
    set runtimepath+=~/.vim/php
"    set keywordprg="help"

"    let g:syntastic_php_checkers=['php', 'phpcs']
    let g:syntastic_check_on_open=0

   "查找当前选中的C符号（函数名、宏、结构体、变量名等）
   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   
   "查找定义
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   
   "查找调用本函数的所有函数
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   
   "查找本函数调用的所有函数
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的字符串
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   
   "查找egrep模式字符串
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>

   "查找当前选中的文件名
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

   "查找包含当前文件的所有文件
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

   "设置PHP的万能补全函数名称
    set omnifunc=phpcomplete#CompletePHP
    endfun " endfun PHP

"""""""""""""""""""""""""""""""""""""""""""""""""XML
  autocmd FileType xml call XML()
    fun! XML()
     "   execute ":set dictionary=C:\\dict\\XML"
    endfun " endfun XML

"""""""""""""""""""""""""""""""""""""""""""""""""PUPPET
  autocmd FileType puppet call PUPPET()
    fun! PUPPET()

    endfun " endfun PUPPET

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
     setlocal omnifunc=jedi#completions

     func! PyDoc(keyword)
         exec ':!pydoc '.a:keyword
     endfunc " PyDoc
   endfun " endfun PYTHON

    autocmd FileType markdown call MARKDOWN()
    fun! MARKDOWN()
        " Enable TOC window auto-fit
        let g:vim_markdown_toc_autofit = 1
        
        " Plug 'junegunn/vim-easy-align'
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    endfun " endfun MARKDOWN()

"##################################################################

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

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

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" filetype plugin indent on

" snippmate keymap change
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

  " For all text files set 'textwidth' to 78 characters.
  "  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" 按下,ch
" 就可以将当前光标下的列高亮，再按下一次，取消高亮；并且可以同时多列高亮。
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" vim-indent-guides配置
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

" YouCompleteMe配置
"let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
if g:uname == "Darwin"
    let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
    if isdirectory(s:clang_library_path)
        let g:clang_library_path=s:clang_library_path
    endif
endif
let g:ycm_extra_conf_globlist = ['~/.vim/bundle/YouCompleteMe/cpp/ycm/*','!~/*']
" https://github.com/Valloric/YouCompleteMe#mac-os-x
let g:ycm_python_interpreter_path = '~/.pyenv/shims/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-z>'

endif " has("autocmd")

" 让vim更方便的支持16进制编辑模式
" ref: http://vim.wikia.com/wiki/Improved_hex_editing
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" ref: https://vi.stackexchange.com/questions/10939/how-to-see-if-a-plugin-is-active
if has_key(g:plugs, 'LeaderF')
    " LeaderF configurations begin
    " don't show the help in normal mode
    let g:Lf_HideHelp = 1
    let g:Lf_UseCache = 0
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_IgnoreCurrentBufferName = 1
    " popup mode
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

    let g:Lf_ShortcutF = "<leader>ff"
    noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

    " search visually selected text literally
    xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
    noremap go :<C-U>Leaderf! rg --recall<CR>

    " should use `Leaderf gtags --update` first
    " install gtags on mac with Homebrew: brew install global && pip install pygments
    " ref: https://zhuanlan.zhihu.com/p/36279445
    " ref: https://zhuanlan.zhihu.com/p/64842373
    " tag database is located in $HOME/.LfCache
    let g:Lf_GtagsAutoGenerate = 1
    let g:Lf_RootMarkers = ['.git', '.hg', '.svn']
    
    " 对于原生支持的6种语言使用内置parser，其他语言使用pygments作为parser
    let g:Lf_Gtagslabel = 'native-pygments' 

    noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
    " LeaderF configurations end
endif

if has_key(g:plugs, 'vim-quickui')
    " vimquickui
    " clear all the menus
    call quickui#menu#reset()

    " Plugin
    call quickui#menu#install('&Plugin', [
                \ [ "&Open Calendar", 'Calendar' ],
                \ [ "&Generate Index", 'Diary', 'Generate Index of Vimwiki Diary' ],
                \ [ "&NERDTree", 'NERDTree' ],
                \ [ "start Draw&It", 'DIstart', 'move and draw using direction key, press <space> to toggle into and out of erase mode' ],
                \ [ "&stop DrawIt", 'DIstop' ],
                \ ])
    
    " GUndo
    call quickui#menu#install('&Gundo', [
                \ [ "&Show", 'GundoShow' ],
                \ [ "&Hide", 'GundoHide' ],
                \ ])

    " Tool
    call quickui#menu#install('&Tool', [
                \ [ "Lookup in &Dictionary", 'call Mydict()', 'Press F to close the result window' ],
                \ [ "Highlight the &Column under cursor ", 'call SetColorColumn()', 'Press ,ch to set/unset this feature' ],
                \ ])

    " items containing tips, tips will display in the cmdline
    call quickui#menu#install('&LeaderF', [
                \ [ 'Find in &File', 'Leaderf file', 'Press \ff in Normal mode' ],
                \ [ 'Find in &MRU', 'Leaderf mru', 'Press \fm in Normal mode' ],
                \ [ 'Find in &Line', 'Leaderf line', 'Press \fl in Normal mode' ],
                \ [ 'Jump to Definition', '', 'Press \fd in Normal mode' ],
                \ [ 'Find all References', '', 'Press \fr in Normal mode' ],
                \ [ 'Recall Last Search', '', 'Press \fo in Normal mode' ],
                \ [ 'Jump to Next result', '', 'Press \fn in Normal mode' ],
                \ [ 'Jump to Previous result', '', 'Press \fp in Normal mode' ],
                \ ])
    " Markdown
    call quickui#menu#install('&Markdown', [
                \ [ "&Preview Markdown", 'MarkdownPreview', "Preview Markdown in a Browser"],
                \ [ "Format Table", '', 'visual select the table code and press ga to Auto Format'],
                \ [ "&Make GFM ToC", 'GenTocGFM', 'Generate GFM style ToC under cursor'],
                \ [ "&ToC", 'Toc', 'Generate ToC in left-split window of vim'],
                \ ])

    " VCSCommand
    call quickui#menu#install("&VCS", [
                \ ['&Add', 'VCSAdd', 'aka. git add'],
                \ ['&Diff', 'VCSVimDiff', 'aka. git diff'],
                \ ['&Log', 'VCSLog', 'aka. git log'],
                \ ])


    " script inside %{...} will be evaluated and expanded in the string
    call quickui#menu#install("&Option", [
                \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
                \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
                \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
                \ ['Toggle &Hex Mode', 'Hexmode' ],
                \ ['Set &Wrap mode %{&wrap? "Off":"On"}', 'set wrap!', 'wrap a long line into lines'],
                \ ])

    " Run with AsyncRun
    call quickui#menu#install("&Run", [
                \ ['Run &Python Script', 'AsyncRun -raw=1 python "%"'],
                \ ['Run &Bash Script', 'AsyncRun bash "%"'],
                \ ['Run Bash Script in &Debug mode', 'AsyncRun bash "%"'],
                \ ['&Update gtags database for Leaderf', 'Leaderf gtags --update'],
                \ ])

    " register HELP menu with weight 1000
    call quickui#menu#install('H&elp', [
                \ ["&Cheatsheet", 'help index', ''],
                \ ['T&ips', 'help tips', ''],
                \ ['--',''],
                \ ["&Tutorial", 'help tutor', ''],
                \ ['&Quick Reference', 'help quickref', ''],
                \ ['&Summary', 'help summary', ''],
                \ ], 10000)

    " enable to display tips in the cmdline
    let g:quickui_show_tip = 1

    " hit space twice to open menu
    noremap <space><space> :call quickui#menu#open()<cr>

endif

