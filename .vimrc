set  rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

   set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
"    set showbreak=↪
    set number
    set relativenumber
"#    set tabstop=2 " the visible width of tabs
    syntax on
    colorscheme desert
    autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0
    set cursorline

" code folding
" https://codeyarns.com/2014/09/02/how-to-fold-code-in-vim/
    set foldmethod=indent " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1
    " Keep all folds open when a file is opened
    augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
    augroup END

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-syntastic/syntastic' 

" Add plugins here

call vundle#end()
filetype plugin indent on
