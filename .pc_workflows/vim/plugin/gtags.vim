"=========================Gtags==========================="

" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
set cscopetagorder=0


" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"let Gtags_Auto_Update = 1
let Gtags_Auto_Map=0
let Gtags_OpenQuickfixWindow = 1
let Gtags_Use_Tags_Format=1

"在项目文件中搜索匹配的单词（忽略大小写）
"nmap <F2> :Gtags -gi<cr>

"在项目文件中搜索光标所在的单词
"nmap <A-e> :Gtags -gi<CR><CR><CR>*.[ch]<CR>

"跳转到光标所在函数的定义
"nmap <C-[> :Gtags<CR><CR>

"搜索光标所在函数的引用
"nmap <A-r> :Gtags -r<CR><CR>
"nmap <leader>g :Gtags

"G Short name for Gtags
cabbrev G Gtags

cscope add GTAGS
