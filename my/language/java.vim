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
