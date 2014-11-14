au BufRead,BufNewFile /usr/local/nginx/* set ft=nginx

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd

augroup filetypedetect
au BufNewFile,BufRead *.wiki setf googlecodewiki
au! BufRead,BufNewFile *.json setfiletype json
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.ctl setf scheme
augroup END

au BufRead,BufNewfile *.smali set filetype=smali
au BufRead,BufNewfile .vimperatorrc set filetype=vim
au BufRead,BufNewFile .tmux.conf set filetype=tmux

