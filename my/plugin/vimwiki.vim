if has_key(g:plugs, 'vimwiki')
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
endif
