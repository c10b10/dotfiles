" `zR` to open all folds ಠ‿ಠ
" `zM` to close all folds ಠ_ಠ

" YouCompleteMe: Autocomplete {{{

" Need to run ./install.sh to get this running after update
Plugin 'Valloric/YouCompleteMe'

" }}}
" NERDTree {{{
"
Plugin 'scrooloose/nerdtree'

" }}}
" Colorscheme {{{

Plugin 'sjl/badwolf'
Plugin 'c10b10/vim-monokai'

" }}}
" PHP Doc {{{

Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'

" }}}
" Fancy status bar {{{

" Plugin 'Lokaltog/vim-powerline'
" Backup of Poweline config
" let g:Powerline_symbols = 'fancy'
" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
" let g:Powerline_colorscheme = 'badwolf'

Plugin 'bling/vim-airline'

" }}}
"
" Surround: Manage surrounding {{{

Plugin 'tpope/vim-surround'

" }}}
" Emmet {{{
"
Plugin 'mattn/emmet-vim'

" }}}
" Git management on steroids {{{
"
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

" }}}
" Tabular: Text filtering & Alignement {{{

Plugin 'godlygeek/tabular'

" }}}
" Gundo: Navigate the vim undo tree visually {{{
"
Plugin 'sjl/gundo.vim'

" }}}
" Scratch: Adds Scratch Buffer {{{

Plugin 'duff/vim-scratch'

" }}}
" Vim-Repeat: Extends the . repeat command {{{
"
Plugin 'tpope/vim-repeat'

" }}}
" Unimpaired: Paired mappings for certain popular uses {{{

" Complete list of mappings can be seen in the documentation
Plugin 'tpope/vim-unimpaired'

" }}}
" Matchit: Extends % to match more than just single characters {{{

Plugin 'edsono/vim-matchit'

" }}}
" MatchTagAlways: Visually match html tags {{{

Plugin 'Valloric/MatchTagAlways'

" }}}
" Taglist: A source code browser used by ctags {{{

Plugin 'vim-scripts/taglist.vim'

" }}}
" Gist plugin {{{
" Requirement
Plugin 'mattn/webapi-vim'
Plugin 'c10b10/gist-vim'
" }}}
" Vim-Session: Session management {{{

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" }}}
" Trailing Whitespace: Removes trailing whitespaces {{{

Plugin 'bronson/vim-trailing-whitespace'

" }}}
" Syntastic: Syntax errors highlighter {{{

Plugin 'scrooloose/syntastic'

" }}}
" Syntax extenders {{{

Plugin 'tpope/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/Trac-Wikimarkup'
" Plugin 'saltstack/salt-vim'
" Plugin 'ingydotnet/yaml-vim'
Plugin 'nono/jquery.vim'
Plugin 'tpope/vim-haml'

" }}}
" Vitality of iTerm2 {{{

Plugin 'sjl/vitality.vim'

" }}}
" CoffeeScript & Coco {{{

Plugin 'kchmck/vim-coffee-script'
" Plugin 'satyr/vim-coco'

" }}}
" Commenting {{{

Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/nerdcommenter'

" }}}
" IndexedSearch: Shows 'Nth match out of M' at search {{{

Plugin 'vim-scripts/IndexedSearch'

" }}}
" AutoCloses pairs like: [], (), '', "" {{{

Plugin 'Raimondi/delimitMate'
" Plugin 'kana/vim-smartinput'

" }}}
" CtrlP {{{

Plugin 'kien/ctrlp.vim'

" }}}
" Ack {{{

Plugin 'mileszs/ack.vim'

" }}}
" ZoomWin {{{

" Plugin 'ZoomWin'

" }}}
" Dash {{{

if has('gui_running')
    Plugin 'rizzatti/funcoo.vim'
    Plugin 'rizzatti/dash.vim'
endif

" }}}
" JSHint {{{

    " Plugin 'wookiehangover/jshint.vim'

" }}}
" Slime {{{

" Plugin 'jpalardy/vim-slime'

" }}}
" Signify {{{

Plugin 'mhinz/vim-signify'

" }}}
" PHPComplete {{{

" Autocompleter
" Plugin 'shawncplus/phpcomplete.vim'
" Syntax highliter
Plugin 'StanAngeloff/php.vim'

" }}}


" OpenBrowser {{{
Plugin 'tyru/open-browser.vim'
" }}}

" == Scala

" Scala {{{

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'ktvoelker/sbt-vim'

" }}}

" === Inactive

" Greplace: `grep` Search and replace {{{

" Plugin 'skwp/greplace.vim'

" }}}

" Twitter {{{

" Plugin 'vim-scripts/TwitVim'

" }}}
" LiveReload {{{

" Plugin 'flomotlik/vim-livereload'

" }}}
" Sudo-GUI: Sudo Save from VIM {{{

	" Replaced by w!!
	" Plugin 'gmarik/sudo-gui.vim'

" }}}
