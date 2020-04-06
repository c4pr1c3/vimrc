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
                \ [ "&Preview", 'MarkdownPreview', "Preview Markdown in a Browser"],
                \ [ "&Stop Preview", 'MarkdownPreviewStop', "Stop Markdown Preview"],
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
                \ ['Toggle He&x Mode', 'Hexmode' ],
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

