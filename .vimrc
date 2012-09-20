"========================================================
" Set vim colorscheme
"========================================================
if has("gui_running")
  colorscheme desert
else
  colorscheme darkblue
endif

"========================================================
" Set the filetype
" =======================================================
"au BufRead,BufNewFile *.json set filetype=json
"au! Syntax json source $HOME/.vim/syntax/json.vim

au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.rl set filetype=ragel

filetype on
filetype plugin indent on
filetype indent on
filetype plugin on

"========================================================
" Set the vim for the dictionary and other basic setting
" =======================================================
"设置文件浏览器目录为当前目录
set autochdir
"设置编码
set enc=utf-8
"设置文件编码
set fenc=utf-8
"设置文件编码检测类型及支持格式
set fencs=utf-8,gb18030,gbk,gb2312,ucs-bom,cp936
" Set the statue of the file
set ruler
" Make the searched word to be highlighted
" set hls
" Make the keyword to be highlighted
syntax on

" Set the Backspace to do on mulitelines
set backspace=indent,eol,start
" Set the whichwrap to do on mulitelines
set whichwrap=b,s,<,>,[,]
" Set all the tab to be the space
set et
" to open the cut line
set lbr
set fo+=mB
" Open the line number
set number
" Formatting 
set ts=4 "Tabs are 4 spaces
set bs=2 "Backspace over everything in insert mode
set shiftwidth=4 " Tabs under smart indent
" auto indent when newline
set autoindent

set smarttab
set expandtab

" show command 
set showcmd
" show mode
set showmode

" Search
set incsearch ignorecase smartcase hlsearch

" tab newline visible 
set list
" set listchars=eol:↓,tab:>-,trail:-
" set listchars=tab:>-,trail:-
set listchars=tab:\ \ ,trail:-

"================================================
" Map the keymap to what I like
" ==============================================
" map! ;; <Esc> " map ;; to Esc in insert and command mode
" map ;; <Esc> " map ;; to Esc in normal, visual, operation mode

"================================================
" Tag list show
" ===============================================
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"================================================
"Fold the source by the syntax
"================================================
set foldmethod=syntax
set foldlevel=1

"===============================================
"vsplit see the cursor
set go-=L

"= let the IM input working well
"set imactivatekey=C-S

"= Tlist Open by press <F8>
map <F8> :TlistToggle<CR>

"=========================Gtags==========================="

let Gtags_Auto_Map=0
let Gtags_OpenQuickfixWindow = 1

"在项目文件中搜索匹配的单词（忽略大小写）
"nmap <F2> :Gtags -gi<cr>

"在项目文件中搜索光标所在的单词
"nmap <A-e> :Gtags -gi<CR><CR><CR>*.[ch]<CR>

"跳转到光标所在函数的定义
nmap <A-[> :Gtags<CR><CR>

"搜索光标所在函数的引用
nmap <A-r> :Gtags -r<CR><CR>
nmap <leader>g :Gtags 


"===============================================
" Vim Spell
"===============================================
map \ss :setlocal spell spelllang=en_us<CR>

"ignore the case when search"
set ic

"Hidden the Memu
set go-=m
"Hidden the Tools
set go-=T

"No more than one buffer
"let g:miniBufExplorerMoreThanOne=0

"Tags, pathes for Coding
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,./TAGS,../TAGS,../../../../../tags
set path=.,./**,../**

"===============================================
"              Vim IM
"===============================================
":let g:vimim_cloud='qq.fuzzy'
":let g:vimim_toggle=-1

"===============================
"         Vim Ruby
"===============================
"call pathogen#infect()

"===============================
"         Super tab
"===============================
let g:SuperTabSetDefaultCompletionType="context"

