" `zR` to open all folds ಠ‿ಠ
" `zM` to close all folds ಠ_ಠ

" SnipMate {{{

" Bundle 'SirVer/ultisnips'

" }}}
" YouCompleteMe: Autocomplete {{{

" Need to run ./install.sh to get this running after update
Bundle 'Valloric/YouCompleteMe'

" }}}
" NERDTree {{{
"
Bundle 'scrooloose/nerdtree'

" }}}
" Colorscheme: Badwolf {{{

Bundle 'sjl/badwolf'

" }}}
" PHP Doc {{{

Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'

" }}}
" Fancy status bar {{{

" Bundle 'Lokaltog/vim-powerline'
" Backup of Poweline config
" let g:Powerline_symbols = 'fancy'
" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
" let g:Powerline_colorscheme = 'badwolf'

Bundle 'bling/vim-airline'

" }}}
"
" Surround: Manage surrounding {{{

Bundle 'tpope/vim-surround'

" }}}
" Zen Coding {{{
"
Bundle 'mattn/zencoding-vim'

" }}}
" Git management on steroids {{{
"
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" }}}
" Tabular: Text filtering & Alignement {{{

Bundle 'godlygeek/tabular'

" }}}
" Gundo: Navigate the vim undo tree visually {{{
"
Bundle 'sjl/gundo.vim'

" }}}
" Scratch: Adds Scratch Buffer {{{

Bundle 'duff/vim-scratch'

" }}}
" Vim-Repeat: Extends the . repeat command {{{
"
Bundle 'tpope/vim-repeat'

" }}}
" Unimpaired: Paired mappings for certain popular uses {{{

" Complete list of mappings can be seen in the documentation
Bundle 'tpope/vim-unimpaired'

" }}}
" Matchit: Extends % to match more than just single characters {{{

Bundle 'edsono/vim-matchit'

" }}}
" MatchTagAlways: Visually match html tags {{{

Bundle 'Valloric/MatchTagAlways'

" }}}
" Taglist: A source code browser used by ctags {{{

Bundle 'vim-scripts/taglist.vim'

" }}}
" Gist plugin {{{
" Requirement
Bundle 'mattn/webapi-vim'
Bundle 'c10b10/gist-vim'
" }}}
" Vim-Session: Session management {{{

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

" }}}
" Trailing Whitespace: Removes trailing whitespaces {{{

Bundle 'bronson/vim-trailing-whitespace'

" }}}
" Syntastic: Syntax errors highlighter {{{

Bundle 'scrooloose/syntastic'

" }}}
" Syntax extenders {{{

Bundle 'tpope/vim-markdown'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'vim-scripts/Trac-Wikimarkup'
" Bundle 'saltstack/salt-vim'
" Bundle 'ingydotnet/yaml-vim'
Bundle 'nono/jquery.vim'
Bundle 'tpope/vim-haml'

" }}}
" Vitality of iTerm2 {{{

Bundle 'sjl/vitality.vim'

" }}}
" CoffeeScript & Coco {{{

" Bundle 'kchmck/vim-coffee-script'
" Bundle 'satyr/vim-coco'

" }}}
" Commenting {{{

Bundle 'tpope/vim-commentary'
" Bundle 'scrooloose/nerdcommenter'

" }}}
" IndexedSearch: Shows 'Nth match out of M' at search {{{

Bundle 'vim-scripts/IndexedSearch'

" }}}
" AutoCloses pairs like: [], (), '', "" {{{

Bundle 'Raimondi/delimitMate'
" Bundle 'kana/vim-smartinput'

" }}}
" CtrlP {{{

Bundle 'kien/ctrlp.vim'

" }}}
" Ack {{{

Bundle 'mileszs/ack.vim'

" }}}
" ZoomWin {{{

" Bundle 'ZoomWin'

" }}}
" GitGutter {{{
"
" Bundle 'airblade/vim-gitgutter'

" }}}
" Dash {{{

if has('gui_running')
    Bundle 'rizzatti/funcoo.vim'
    Bundle 'rizzatti/dash.vim'
endif

" }}}
" JSHint {{{

    Bundle 'wookiehangover/jshint.vim'

" }}}
" Slime {{{

Bundle 'jpalardy/vim-slime'

" }}}

" === Inactive

" Greplace: `grep` Search and replace {{{

" Bundle 'skwp/greplace.vim'

" }}}

" Twitter {{{

" Bundle 'vim-scripts/TwitVim'

" }}}
" LiveReload {{{

" Bundle 'flomotlik/vim-livereload'

" }}}
" Sudo-GUI: Sudo Save from VIM {{{

	" Replaced by w!!
	" Bundle 'gmarik/sudo-gui.vim'

" }}}
