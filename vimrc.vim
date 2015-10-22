" disable vi compatibility
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
    Plugin 'tpope/vim-fugitive'
    Plugin 'bling/vim-airline'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'sjl/gundo.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'valloric/MatchTagAlways'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'altercation/vim-colors-solarized'
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

    " reload changes from outside
    set autoread

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
    " disable folding
    set nofoldenable
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
    " always show the mode we're editing in
    set showmode

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
    " set 7 lines to the cursor when moving with j/k
    set so=7
    " treat long lines as break lines
    nnoremap j gj
    nnoremap k gk
" }

" status line {
    " always show the status line
    set laststatus=2
" }

" keymappings {
    " set the leader-key
    let mapleader = "\<Space>"

    " quickly edit dotfiles
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>ez :vsplit ~/.zshrc<cr>

    " quick save
    nmap <leader>w :w!<cr>


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

    " Switch to specific tab numbers with Command-number
    noremap <D-1> :tabn 1<CR>
    noremap <D-2> :tabn 2<CR>
    noremap <D-3> :tabn 3<CR>
    noremap <D-4> :tabn 4<CR>
    noremap <D-5> :tabn 5<CR>
    noremap <D-6> :tabn 6<CR>
    noremap <D-7> :tabn 7<CR>
    noremap <D-8> :tabn 8<CR>
    noremap <D-9> :tabn 9<CR>
    " Command-0 goes to the last tab
    noremap <D-0> :tablast<CR>
    " }

" plugins {
    " vim-airline {
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        set noshowmode
        let g:airline_powerline_fonts = 1
        let g:airline_detect_modified = 1

        if has('gui_running')
            let g:airline_theme = 'molokai'
        else
            let g:airline_theme = 'molokai'
        endif
    " }
    " vim-markdown {
        let g:vim_markdown_folding_disabled=1
    " }

    " Gundo {
        nnoremap <D-ü> :GundoToggle<CR>
    " }
" }
