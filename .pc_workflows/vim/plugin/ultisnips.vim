" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="jj"
let g:UltiSnipsListSnippets="jJ"
let g:UltiSnipsJumpForwardTrigger="jj"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
call UltiSnips#map_keys#MapKeys()
let g:UltiSnipsSnippetsDir=expand("$PCWF/vim/UltiSnips")

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

