"https://github.com/Valloric/YouCompleteMe/issues/9
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt=menu,menuone
let g:EclimCompletionMethod = 'omnifunc'

"Open in all language
let g:ycm_filetype_blacklist = {'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}
let g:ycm_confirm_extra_conf = 0
