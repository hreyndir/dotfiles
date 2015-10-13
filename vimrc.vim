" must be first line
set nocompatible
filetype off

" plugins {
    " vundle {
        " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        " alternatively, pass a path where Vundle should install plugins
        "call vundle#begin('~/some/path/here')

        " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'
    " }

    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'nvie/vim-flake8'
    Plugin 'kballard/vim-swift'

    call vundle#end()
    filetype plugin indent on
" }

" general {
    " lines of history to be remebered
    set history=700
    " enable filetype plugins
    set autoindent
    set nosmartindent
    filetype plugin indent on

    " maximize on startup
    set lines=999
    set columns=9999
" }

" colors {
    colorscheme solarized
    set background=dark
" }

" ui {
    " syntax highlighting
    syntax on
    syntax enable
    " show line numbers
    set number
    " show last command entered
    set showcmd
    " highlight current line
    set cursorline
    " font
    set guifont=Hack:h15
    " highlight problematic whitespace
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    " enable mouse
    set mouse=a
    " enable visual autocomplete for commend menu
    set wildmenu
    " redraw only when needed
    set lazyredraw
    " highlight matching parenthesis when moving cursor
    set showmatch

    " disable audio bell
    if has('gui_running')
        autocmd GUIEnter * set vb t_vb=
    endif
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd GUIENTER,BufNewFile,BufFilePre,BufRead,BufReadPost set vb t_vb=
" }

" formatting {
    scriptencoding utf-8
    " number of visual spaces per tab
    set tabstop=4
    " number of spaces in tab when editing
    set softtabstop=4
    " tabs are spaces
    set expandtab
" }

" search {
    " search characters as entered
    set incsearch
    " highlight matches
    set hlsearch
    " ignore case
    set ignorecase
    set smartcase
" }

" movement {
    " treat long lines as break lines
    nnoremap j gj
    nnoremap k gk
" }

" status line {
    " always show the status line
    set laststatus=2
" }

" keymappings {
    " hardmode
    nnoremap <Left> <nop>
    nnoremap <Right> <nop>
    nnoremap <Up> <nop>
    nnoremap <Down> <nop>

    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    " highlight last inserted text
    nnoremap gV `[v`]
" }
