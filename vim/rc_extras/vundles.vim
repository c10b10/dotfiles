" `zR` to open all folds ಠ‿ಠ
" `zM` to close all folds ಠ_ಠ
" `za` to open current fold

" ----------------------
" Vitality of iTerm2 {{{

    Plugin 'sjl/vitality.vim'

    let g:vitality_fix_cursor=1
    let g:vitality_fix_focus=1
    let g:vitality_always_assume_iterm=1

" }}}
" ---------------
" Colorscheme {{{

    " Plugin 'c10b10/badwolf'
    " colorscheme badwolf
    " let g:badwolf_tabline = 2
    " let g:badwolf_html_link_underline = 0

    Plugin 'c10b10/vim-monokai'

    colorscheme monokai
    let g:monokai_italic = 1

" }}}
" ------------
" NERDTree {{{

    Plugin 'scrooloose/nerdtree'

    noremap  <leader>nt :NERDTreeToggle<cr>

    augroup ps_nerdtree
        au!

        au Filetype nerdtree setlocal nolist
        " au Filetype nerdtree nnoremap <buffer> K :q<cr>
    augroup END

    let NERDTreeHighlightCursorline = 1
    let NERDTreeIgnore = ['\~$', '.git$[[dir]]', '.DS_Store', '.*\.pyc$',
                        \ 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid',
                        \ 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db',
                        \ 'tags.bak']
    let NERDTreeShowHidden = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let NERDChristmasTree = 1
    let NERDTreeChDirMode = 1
    let NERDTreeMapJumpFirstChild = 'gK'
    let NERDTreeBookmarksFile = expand('~/bin/dotfiles/vim/nt/NERDTreeBookmarks')
    let NERDTreeShowLineNumbers=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeWinSize = 40
" AutoCloses pairs like: [], (), '', "" {{{

    Plugin 'Raimondi/delimitMate'

" }}}
" ---------------------
" Fancy surrounding {{{

    Plugin 'tpope/vim-surround'

" }}}
" --------------------
" Fancy status bar {{{

    Plugin 'bling/vim-airline'

    let g:airline_left_sep = '▙'
    let g:airline_left_alt_sep = '▚'
    let g:airline_right_sep = '▟'
    let g:airline_right_alt_sep = '▞'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_theme='badwolf'

" }}}
" ---------------------------------
" Unimpaired: Add more mappings {{{

    Plugin 'tpope/vim-unimpaired'

    " Mapping for moving lines

    " Method described here: http://vimcasts.org/episodes/bubbling-text/
    " Bubble single lines. Alt-k & Alt-j symbols. Requires Tim Pope's unimpaired
    " Mapping for moving lines
    " Method described here: http://vimcasts.org/episodes/bubbling-text/

    " Bubble single lines. Alt-k & Alt-j symbols. Requires Tim Pope's unimpaired
    nmap ∆ ]e
    nmap <M-j> ]e
    nmap ˚ [e<esc>
    nmap <M-k> [e<esc>

    " Bubble multiple lines
    vmap ˚ [egv
    nmap <M-j> [egv
    vmap ∆ ]egv
    nmap <M-k> ]egv

" }}}
" --------------------------------------------
" Vim-Repeat: Extends the . repeat command {{{

    Plugin 'tpope/vim-repeat'

" }}}
" ------------------------------------------------------------
" Matchit: Extends % to match more than just single characters {{{

    Plugin 'edsono/vim-matchit'

    " Match % with tab
    runtime macros/matchit.vim
    map <tab> %
    if mapcheck( '[%' )
        unmap [%
        unmap ]%
    endif

" }}}
" -------------------------------------------------------
" IndexedSearch: Shows 'Nth match out of M' at search {{{
    Plugin 'vim-scripts/IndexedSearch'

" }}}
" -----------------------------------------------------
" Trailing Whitespace: Removes trailing whitespaces {{{

    Plugin 'bronson/vim-trailing-whitespace'

    nnoremap <leader>ws :FixWhitespace<cr>

" }}}
" ---------
" CtrlP {{{

    Plugin 'kien/ctrlp.vim'

    let g:ctrlp_dont_split = 'NERD_tree_2'
    let g:ctrlp_jump_to_buffer = 0
    let g:ctrlp_map = '<leader>,'
    let g:ctrlp_match_window_reversed = 1
    let g:ctrlp_open_new_file = 'r'
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_max_height = 20
    let g:ctrlp_use_caching = 0
    let g:ctrlp_extensions = ['tag']
    let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'ToggleFocus()':        ['<c-tab>'],
    \ }
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|\w+_pull_\w+$',
      \ 'file':  '\v\.(sql|jpg|png)$',
      \ }
    let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|tags|*.vim|.DS_Store' " MacOSX/Linux
    " let g:ctrlp_dotfiles = 0

    nnoremap <leader>. :CtrlPTag<cr>

" }}}
" -------
" Ack {{{

    Plugin 'mileszs/ack.vim'

    nnoremap <leader>a :Ack! -G php<space>
    let g:ackprg = 'ag --nogroup --nocolor --column'

" }}}
" ----------------------------------------------
" Gundo: Navigate the vim undo tree visually {{{

    Plugin 'sjl/gundo.vim'

    nmap <f5> :GundoToggle<cr>

" }}}
" -------------------------------
" Improve rainbow paranthesis {{{

    " Plugin 'luochen1990/rainbow'

    " let g:rainbow_active = 1
    " " https://github.com/pangloss/vim-javascript/issues/184
    " autocmd FileType javascript syntax clear jsFuncBlock

" }}}
" --------------------------------------------------
" Signify: Shows git diff in the line number bar {{{

    Plugin 'mhinz/vim-signify'

" }}}
" --------------
" Commenting {{{

    Plugin 'tpope/vim-commentary'

" }}}
" --------------------
" Syntax extenders {{{

    Plugin 'tpope/vim-markdown'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'ap/vim-css-color'
    Plugin 'vim-scripts/Trac-Wikimarkup'
    Plugin 'tpope/vim-haml'

" }}}
" --------------
" JavaScript {{{
    " Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'crusoexia/vim-javascript-lib'
    " Plugin 'kchmck/vim-coffee-script'
" }}}
" -------------
" SaltStack {{{
    " Plugin 'saltstack/salt-vim'
" }}}
