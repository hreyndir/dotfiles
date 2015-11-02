" disable vi compatibility
set nocompatible
filetype off

" plugins {{{
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
    Plugin 'airblade/vim-gitgutter'
    Plugin 'bling/vim-airline'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'sjl/gundo.vim'
    Plugin 'mhinz/vim-startify'
    Plugin 'valloric/MatchTagAlways'
    Plugin 'scrooloose/syntastic'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'nvie/vim-flake8'
    Plugin 'Shougo/unite.vim'
    Plugin 'kballard/vim-swift'

    call vundle#end()
    filetype plugin indent on
" }}}

" general {{{
    " lines of history to be remebered
    set history=700
    " enable filetype plugins
    set autoindent
    set nosmartindent
    filetype plugin indent on

    " reload changes from outside
    set autoread

    " working directory is always where the current file is located
    set autochdir

    " maximize on startup
    set lines=999
    set columns=9999
" }}}

" colors {{{
    colorscheme molokai
    set background=dark
" }}}

" ui {{{
    " syntax highlighting
    syntax on
    syntax enable
    " show line numbers
    set number
    " wrap lines
    set wrap
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
        autocmd! GUIEnter * set vb t_vb=
    endif
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd GUIENTER,BufNewFile,BufFilePre,BufRead,BufReadPost set vb t_vb=
" }}}

" formatting {{{
    scriptencoding utf-8
    " number of visual spaces per tab
    set tabstop=4
    " number of spaces in tab when editing
    set softtabstop=4
    " tabs are spaces
    set expandtab

    " commands {
        " When inserting a new line do not take special characters from the
        " line above
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " }
" }}}

" search {{{
    " search characters as entered
    set incsearch
    " highlight matches
    set hlsearch
    " ignore case
    set ignorecase
    set smartcase
" }}}

" movement {{{
    " set 7 lines to the cursor when moving with j/k
    set so=7
" }}}

" status line {{{
    " always show the status line
    set laststatus=2
" }}}

" keymappings {{{
    " set the leader-key
    let mapleader = "\<Space>"

    " leave insert with jk
    inoremap jk <ESC>

    " quickly edit dotfiles
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>ez :vsplit ~/.zshrc<cr>

    " quick save
    nmap <leader>w :w!<cr>

    " treat long lines as break lines
    nnoremap j gj
    nnoremap k gk

    " hardmode
    nnoremap <Left> <nop>
    nnoremap <Right> <nop>
    nnoremap <Up> <nop>
    nnoremap <Down> <nop>

    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    " delete word under cursor
    map ä viwdi

    " clear highlights
    map ö :nohl<Enter>

    " Visual shifting
    vnoremap < <gv
    vnoremap > >gv

    " Duplicate current line
    nnoremap <D-j> yyp

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
" }}}

" plugins {{{
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

    " vim-easymotion {
        " map forward and backword easymotion to f
        nnoremap f H:call EasyMotion#WB(0, 0)<CR>
        let g:EasyMotion_do_mapping = 0 " Disable default mappings

        " Bi-directional find motion
        nmap s <Plug>(easymotion-s2)

        " Turn on case sensitive feature
        let g:EasyMotion_smartcase = 1
    " }

    " Gundo {
        nnoremap <D-ü> :GundoToggle<CR>
    " }

    " vim-startify {
        let g:startify_bookmarks = [
                \ '~/.vimrc',
                \ '~/.zshrc'
                \ ]
        let g:startify_change_to_dir = 1
        let g:startify_change_to_vcs_root = 0
        let g:startify_custom_footer = ''
        let g:startify_custom_header = [
                \ '',
                \ '    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ',
                \ '   ███    ███ ███  ▄██▀▀▀███▀▀▀██▄',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███▌ ███   ███   ███',
                \ '   ███    ███ ███  ███   ███   ███',
                \ '   ███    ███ ███  ███   ███   ███',
                \ '    ▀██████▀  █▀    ▀█   ███   █▀ ',
                \ '',
                \ '',
                \ '',
                \ ]
        let g:startify_custom_indices = []
        let g:startify_disable_at_vimenter = 0
        let g:startify_enable_special = 1
        let g:startify_files_number = 10
        let g:startify_list_order = [
                \ ['   Sessions:'],
                \ 'sessions',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ['   Most recently used files'],
                \ 'files',
                \ ['   Most recently used files in the current directory:'],
                \ 'dir',
                \ ]
        let g:startify_relative_path = 0
        let g:startify_session_autoload = 0
        let g:startify_session_delete_buffers = 0
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_session_persistence = 1
        let g:startify_session_savecmds = []
        let g:startify_session_savevars = [
               \ 'g:startify_session_savevars',
               \ 'g:startify_session_savecmds',
               \ 'g:random_plugin_use_feature'
               \ ]
        let g:startify_skiplist_server = []
        let g:startify_skiplist = []
    " }
" }}}
