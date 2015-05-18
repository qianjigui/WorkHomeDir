"========================================================
" Set vim colorscheme
"========================================================
"if has("gui_running")
"  colorscheme desert
"else
"  colorscheme darkblue
"endif
colorscheme desert

"========================================================
" Font size
"========================================================
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
endif

" Set the statue of the file
set ruler

" Open the line number
set number

" show command 
set showcmd

" show mode
set showmode

"vsplit see the cursor
set go-=L
"Hidden the Memu
set go-=m
"Hidden the Tools
set go-=T

"========================================================
" Set the vim for the dictionary and other basic setting
" =======================================================
" to open the cut line
set fo+=mB

" tab newline visible 
" set list
" set listchars=eol:↓,tab:>-,trail:-
" set listchars=tab:>-,trail:-
" set listchars=tab:\ \ ,trail:-
" autocmd BufRead,BufNewFile *.go set listchars=tab:\|\ ,trail:-


"===============================================
" Vim Spell
"===============================================
map \ss :setlocal spell spelllang=en_us<CR>

"Tags, pathes for Coding
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,./TAGS,../TAGS,../../../../../tags
set path=.
