" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsListSnippets="<C-Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-m>"
call UltiSnips#map_keys#MapKeys()
let g:UltiSnipsSnippetsDir=expand("$PCWF/vim/UltiSnips")

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

