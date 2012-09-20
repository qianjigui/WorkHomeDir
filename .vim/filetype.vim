au BufRead,BufNewFile /usr/local/nginx/* set ft=nginx
au BufRead,BufNewFile /home/wpc/.vimperatorrc set ft=vimperator
au BufRead,BufNewFile /home/wpc/.tmux.conf set ft=tmux

augroup filetypedetect
au BufNewFile,BufRead *.wiki setf googlecodewiki
au! BufRead,BufNewFile *.json setfiletype json
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.ctl setf scheme
augroup END
