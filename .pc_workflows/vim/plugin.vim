set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Generate
Plugin 'myusuf3/numbers.vim'
Plugin 'jpalardy/spacehi.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdtree'
"Plugin 'vimim/vimim'

Plugin 'edsono/vim-matchit'
Plugin 'Townk/vim-autoclose'

"Auto Complete
"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'qianjigui/gtags.vim'

"Support IDE on languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'

"Support filetype
Plugin 'tfnico/vim-gradle'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'diefans/vim-da-yaml'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
