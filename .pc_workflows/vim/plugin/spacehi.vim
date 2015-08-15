let g:spacehi_tabcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"
let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
"help file close SpaceHi
autocmd FileType help NoSpaceHi

"For golang tab
"autocmd FileType go let g:spacehi_tabcolor="ctermfg=White ctermbg=DarkBlue guifg=White guibg=DarkBlue"
autocmd FileType go let g:spacehi_tabcolor="ctermfg=White ctermbg=DarkGray guifg=White guibg=DarkGray"
autocmd BufRead,BufNewFile *.go set listchars=tab:\|\ ,trail:-

