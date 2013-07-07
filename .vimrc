".vimrc
" Author: Alex Ciobica <alex.ciobica@gmail.com>
" Inspiration form: Steve Losh, Jeffrey Way, Derek Wyatt

" `zR` to open all folds ಠ‿ಠ
" `zM` to close all folds ಠ_ಠ

" Preamble ----------------------------------------------------------- {{{

" Be IMproved
set nocompatible

" Vundle ----------------------------------------------------------- {{{

filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'
source ~/.vim/rc_extras/vundles.vim " Include my bundles
filetype plugin indent on " required

" }}}

" }}}
" Basic options ----------------------------------------------------------- {{{

" General {{{
"
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set visualbell " Stop the damn beeping!
set autoindent
set smartindent
set ruler " Display cursor coordinates
set ch=2 " Make command line x lines high
set fileformat=unix " <NL> endings
set list
set listchars=tab:\|\ ,eol:¬,extends:>,precedes:< " Special Chars
set showbreak=↪
set fillchars=diff:⣿,vert:│ " Set the diff and vertical split chars
set showcmd " Show command in bottom right portion of the screen
set hidden "Switch between buffers without saving
set number " Show lines numbers
set ttyfast " I have a fast terminal
set shell=/bin/bash\ --login
set lazyredraw " Don't redraw screen while executing macros
set undofile " Save undo history in a file
set undoreload=10000 " Costly for Memory
set splitbelow " H split below
set splitright " V split to the right
set title " Show the title in window bar
set colorcolumn=+1 " Highlight the textwidth column
set linebreak " Wrap long lines at characters in 'breakat'
set laststatus=2 "Always show the status line
set synmaxcol=800 " Don't highlight lines longer than 800 characters.
set dictionary=/usr/share/dict/words
set spellfile+=~/.vim/custom-dictionary.utf-8.add
set autowrite
set autoread
set mousehide "Hide mouse when typing
set shell=zsh\ -i

set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help "Session settings

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
" set timeoutlen=400
set notimeout
set ttimeout
set ttimeoutlen=10

" Resize splits when the window is resized
au VimResized * :wincmd =

" Syntax
au BufRead,BufNewFile *.wiki set syntax=wiki
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" }}} [/General]
" Leader {{{
"
let mapleader = ","
let maplocalleader = "\\"

" }}}
" Color scheme {{{

syntax on
set background=dark
let g:badwolf_tabline = 2
let g:badwolf_html_link_underline = 0
colorscheme badwolf

" Reload the colorscheme whenever we write the file.
augroup color_badwolf_dev
    au!
    au BufWritePost badwolf.vim color badwolf
augroup END

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Cursorline {{{

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}} [/Cursorline]
" Tabs, spaces, wrapping {{{

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set wrap " as opposed to nowrap
set formatoptions=qrn1
au BufNewFile,BufRead *.php setlocal tabstop=4
au BufNewFile,BufRead *.php setlocal noexpandtab
au BufNewFile,BufRead *.py setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}
" Wildmenu (Command line) completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Backups {{{

set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
"
" }}} [/Basic options]
" Searching and movement -------------------------------------------------- {{{
"
" Use sane (perl style) regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase " Ignore case when searching
set smartcase " ... except when capitals are used
set incsearch " Set incremental searching
set hlsearch " Highlight searching
set wrapscan " Searches wrap around the end of the file
set showmatch " Blinks the closing brackets to show match
set matchtime=2 " Hundreds of milliseconds to show the matching parent

set gdefault " :s/search/replace/g <- global always on

set scrolloff=3 " Min no of lines to keep above / below cursor
set sidescroll=1
set sidescrolloff=10 " When nowrap is set, columns left / right

set virtualedit=block " Cursor block limit gone only in <C-V> mode

" Clears searches and highlights
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Match % with tab
runtime macros/matchit.vim
map <tab> %
if mapcheck( '[%' )
	unmap [%
	unmap ]%
endif

" Made D behave
" nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Emacs Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Allow command line editing like emacs
cnoremap <c-a>      <Home>
cnoremap <c-b>      <Left>
cnoremap <c-e>      <End>
cnoremap <c-f>      <Right>
cnoremap <c-n>      <End>
cnoremap <c-p>      <Up>
cnoremap <esc>b     <S-Left>
cnoremap <esc>f     <S-Right>
cnoremap <esc><c-h> <C-W>

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Directional Keys {{{

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Maps to make handling windows a bit easier
noremap <silent> <C-F9>  :vertical resize -5<CR>
noremap <silent> <C-F10> :resize +5<CR>
noremap <silent> <C-F11> :resize -5<CR>
noremap <silent> <C-F12> :vertical resize +5<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,s9 :vertical resize 100<CR>

" }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
" Quickfix / Location navigation {{{

nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

" Options & Mappings {{{

set foldenable "Enable code folding

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO (zOh) recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Filetype-specific {{{

" .virmc {{{

augroup vimrc
    au!

    au BufNewFile,BufRead .virmc setlocal foldmethod=marker

augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" HTML {{{

" Depends on the html5 plugin
" let g:html_indent_tags = ['p', 'li']

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=html

    au FileType html setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html nnoremap <buffer> <localleader>= Vat=

augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    au BufNewFile,BufRead .virmc setlocal foldmethod=marker

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><ESC>`z4l
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" }}}

" }}}
" Includes --------------------------------------------------------------- {{{

" Include my super secret stuff
if filereadable("~/.vim/rc_extras/secret.vim")
    source ~/.vim/rc_extras/secret.vim
endif

" }}}
" Convenience mappings ---------------------------------------------------- {{{

" Work stuff {{{

nmap <localleader>w3 5ggC4ggC4ggC5gg
nmap <localleader>vp /wp-content<cr>C/ plugins<cr>C<leader><space>
nmap <localleader>vt /wp-content<cr>C/themes<cr>C<leader><space>
" nmap ,ii :NERDTree<cr>/\.\.<cr>jjjjjjjCnjjjjCnjjjC

" Returns the functions and its description in a table format
let @q='/function viwlwf{hlF)"oy?/\*\*0jf*wv$"py/functionjmagg"opuo"op0diwxvf)S`A | "pp`a'
let @e='/^functionwvw%"oyma?/\*\*jwwv$h"pyggo"opva(:klklklklklsilent! krkrkrkrkrs/,/`<br\/>`/g0f(i | wds(A | "pp0viwS`f|wvf|eS``a'

" }}}

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Saves time.
" nmap ; :
" vmap ; :
nmap <leader>b :b<space>

" Open gist with the id under the cursor
cnoreabbrev gsst/ https://gist.github.com/
nmap ,og viW"gy:!open gsst/ <bs><C-r>g<cr>

" CD to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Select latest paste
nnoremap gp `[v`]

" Stop it, hash key.
inoremap # X<BS>#

" Sort lines
noremap <leader>ss vip:!sort<cr>
vnoremap <leader>ss :!sort<cr>

" Tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Source .vimrc
nmap <leader>eev :source $MYVIMRC<cr>

" For some reason Vim no longer wants to talk to the OS X pasteboard through "*.
function! g:FuckingCopyTheTextPlease()
    normal! gv
    silent '<,'>w !pbcopy
endfunction
noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
noremap <leader>p :r!pbpaste<cr>
" Copy in vim's clipboard
vnoremap <leader>y :<c-u>call g:FuckingCopyTheTextPlease()<cr>

" i constantly hit "u" in visual mode when i mean to "y". use "gu" for those rare occasions.
" from https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
vnoremap u <nop>
vnoremap gu u

" For some reason ctags refuses to ignore Python variables, so I'll just hack
" the tags file with sed and strip them out myself.
" TODO Do this for php
" Sigh.
nnoremap <leader><cr> :silent !/usr/local/bin/ctags -R . && sed -i .bak -E -e '/^[^	]+	[^	]+.py	.+v$/d' tags<cr>:redraw!<cr>

" It returns the syntax highlighting group that the current "thing" under the
" cursor belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Substitute
nnoremap <leader>r :%s//<left>
vnoremap <leader>r :s//<left>

" Panic Button!!!
nnoremap <f9> mzggg?G`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Reformat line.
" I never use l as a macro register anyway.
" nnoremap ql ^vg_gq

" Easier linewise reselection
nnoremap <leader>V V`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Marks and Quotes
noremap ' `
noremap ` <C-^>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
" TODO ?
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
" TODO Better map for terminal?
nnoremap <F6> :set paste!<cr>

" Toggle invisible characters
nnoremap <leader>i :set list!<cr>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Easy filetype switching {{{

nnoremap _md :set filetype=markdown<CR> nnoremap _h :set filetype=html<CR>
nnoremap _p :set filetype=php<CR> nnoremap _js :set filetype=javascript<CR>
nnoremap _v :set filetype=vim<CR>

" }}}

" }}}
" Abbreviations ----------------------------------------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('shorcode',  'shortcode')
call MakeSpacelessIabbrev('shorcodes',  'shortcodes')
call MakeSpacelessIabbrev('add_shorcode',  'add_shortcode')

iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ

iabbrev check &#x2713;
iabbrev mdlink [](http://)

iabbrev ac@ alex.ciobica@gmail.com
iabbrev vrcf `~/.vimrc` file

call MakeSpacelessIabbrev('dmp', 'ac_dump(  );<Left><Left><Left>')
call MakeSpacelessIabbrev('vdmp', 'var_dump(  );<Left><Left><Left>')
call MakeSpacelessIabbrev('clog', 'console.log(  );<Left><Left><Left>' )
call MakeSpacelessIabbrev('esq', '\"\"<Left><Left>')
call MakeSpacelessIabbrev('enl', 'echo "\n\n";<Left><Left><Left><Left>' )
call MakeSpacelessIabbrev('icm', '/**  */<Left><Left><Left>' )
call MakeSpacelessIabbrev('?p', '<?php?><Left><Left><CR><ESC>O' )
call MakeSpacelessIabbrev('p?', '?><?php><Backspace><M-Left><M-Left><CR><ESC>O' )
call MakeSpacelessIabbrev('htmlc', '<!--  --><Left><Left><Left><Left>' )
call MakeSpacelessIabbrev('arrr', 'array( '' => x )<M-Left><M-Left><M-Left><M-Left><Right>' )
call MakeSpacelessIabbrev('secho', 'echo <<<EOL<Right><Right><Right><Backspace><Backspace><Backspace><Return><Return>EOL;<Up>' )
call MakeSpacelessIabbrev('pyd', 'import pdb; pdb.set_trace()' )

" }}}
" Quick editing ----------------------------------------------------------- {{{
"
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>eb :tabedit ~/.vim/rc_extras/vundles.vim<cr>
nnoremap <leader>eh :tabedit ~/.vim/vim-shortcuts.txt<cr>
nnoremap <leader>es :tabedit ~/.vim/rc_extras/secret.vim<cr>

" }}}
" Plugins ------------------------------------------------------------ {{{

" Unimpaired {{{

" Mapping for moving lines {{{

" Method described here: http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines. Alt-k & Alt-j symbols. Requires Tim Pope's unimpaired
" Mapping for moving lines
" Method described here: http://vimcasts.org/episodes/bubbling-text/

" Bubble single lines. Alt-k & Alt-j symbols. Requires Tim Pope's unimpaired
nmap ∆ ]e
nmap ˚ [e<esc>

" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

" }}}

" }}}
" Scratch {{{

nnoremap <silent> <leader><tab> :ScratchToggle<cr>
command! ScratchToggle call ScratchToggle()
function! ScratchToggle() " {{{
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>L"
        let w:is_scratch_window = 1
    endif
endfunction " }}}

" }}}
" Syntastic {{{

" :help syntastic-checker-options for more info
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--report=csv -psv --standard=/usr/lib/php/pear/PHP/CodeSniffer/Standards/WordPress/phpcs.ruleset.xml --extensions=php"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['sass', 'scss'] }
let g:syntastic_enable_signs=1
" let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '⚠'
let g:syntastic_ignore_files=['\.*/wp-includes/', '\.*/wp-admin/']

" }}}
" Surround TODO {{{

" Cut current function TODO
nmap vix ?function<CR>Vf{%x<leader><space>
" Surround inner ( with spaces
nmap vv f(vi(S<Space><Space>
" Surround current word with paranthesis
nmap vi9 viWS(

" }}}
" YouCompleteMe {{{

let g:ycm_key_invoke_completion = '<Alt-Space>'
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers =  {
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \ }

" }}}
" Snippets {{{ "

let g:UltiSnipsExpandTrigger = '<C-\>'

" }}}
" Zen Coding {{{
	"Change zen coding plugin expansion key to shift + e
	let g:user_zen_expandabbr_key = '<C-e>'
" }}}
" Vitality for iTerm2 {{{

let g:vitality_fix_cursor=1
let g:vitality_fix_focus=1
let g:vitality_always_assume_iterm=1

" }}}
" Trailing whitespace {{{

nnoremap <leader>ws :FixWhitespace<cr>

" }}}
" Ctrl-P {{{

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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\',
  \ }
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|tags|*.vim|.DS_Store' " MacOSX/Linux
" let g:ctrlp_dotfiles = 0

nnoremap <leader>. :CtrlPTag<cr>

" }}}
" Gundo {{{

nmap <f5> :GundoToggle<cr>

" }}}
" Fugitive {{{

autocmd BufReadPost fugitive://* set bufhidden=delete
cnoreabbrev gw Gwrite
cnoreabbrev gc Gcommit
cnoreabbrev gcm Gcommit -m ""<Left>
cnoreabbrev Gst Gstatus

" }}}
" NERD Tree {{{

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

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
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 40

" }}}
" PHPDoc {{{

" TODO Tweak!

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" }}}
" Fancy status line {{{

let g:airline_left_sep = '⮀ '
let g:airline_right_sep = '⮂'
let g:airline_linecolumn_prefix = '⭡ '
let g:airline_fugitive_prefix = ' ⭠ '

" }}}
" ctags {{{

" Generate ctags in current directory
nmap <leader>tt :!ctags<cr>

" }}}
" Tag List {{{

" Set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" Close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" Make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" Width of window
let Tlist_WinWidth = 40
" Close tlist when a selection is made
let Tlist_Close_On_Select = 1

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" CoffeeScript {{{
nnoremap <leader>cof :cd ~/Projects/CoffeeScript/<cr>
nnoremap <leader>cf :CoffeeCompile 10<cr>
nnoremap <leader>cfm :CoffeeMake<cr>
nnoremap <leader>cfr :CoffeeRun<cr>
" }}}
" Session {{{

let g:session_directory='~/.vim/sessions'
let g:session_autoload='yes'
" let g:session_autosave='yes'
let g:session_default_to_last=0
nmap <F10> :SaveSession<cr>

" }}}
" Gist {{{

cnoreabbrev gst Gist -p
cnoreabbrev gstl Gist -l
cnoreabbrev gstt Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filteyype = 1
let g:gist_open_browser_after_post = 0
let g:gist_show_privates = 1
" Update Gist only with :w!
let g:gist_update_on_write = 2

" }}}
" Ack {{{

nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" Ack motions {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" For example: \aiw will Ack for the word under the cursor. \aib will Ack for the contents of the parentheses the cursor is inside.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <localleader>a :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <localleader>a :<C-U>call <SID>AckMotion(visualmode())<CR>

" nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
" xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" }}}

" }}}
" ZoomWin {{{

nmap <localleader>z :ZoomWin<cr>

" }}}
" GitGutter {{{
let g:gitgutter_on_bufenter = 0
" }}}
" Dash {{{
nmap <leader>dd :Dash<cr>
nmap <leader>dg :Dash!<cr>
" }}}
" JSHint {{{
let g:JSHintHighlightErrorLine = 0
" }}}

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
" Next and Last {{{
"
" Motion for "next/last object".  "Last" here means "previous", not "final".
" Unfortunately the "p" motion was already taken for paragraphs.
"
" Next acts on the next object of the given type in the current line, last acts
" on the previous object of the given type in the current line.
"
" Currently only works for (, [, {, b, r, B, ', and ".
"
" Some examples (C marks cursor positions, V means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      C
"                                                      foo = bar('')
"                                                                C
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      C
"                                                      foo = bar
"                                                               C
"
" vil"  -> select inside last double quotes            print "hello ", name
"                                                                        C
"                                                      print "hello ", name
"                                                             VVVVVV

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}
" Numbers {{{

" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" }}}

" }}}
" Mini-plugins ------------------------------------------------------------ {{{
" Stuff that should probably be broken out into plugins, but hasn't proved to be
" worth the time to do so just yet.

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>

" }}}
" Diffwhite Toggle {{{

set diffopt-=iwhite
let g:diffwhitespaceon = 0
function! ToggleDiffWhitespace()
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}
" Error Toggles {{{

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>

" }}}
" Indent Guides {{{
" Toggle Showing Indent guides: <leader>B

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>

" }}}
" Block Colors {{{
" Toggle showing of block colors

let g:blockcolor_state = 0
function! BlockColor() " {{{
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
        call matchdelete(77884)
        call matchdelete(77885)
        call matchdelete(77886)
    else
        let g:blockcolor_state = 1
        call matchadd("BlockColor1", '^ \{4}.*', 1, 77881)
        call matchadd("BlockColor2", '^ \{8}.*', 2, 77882)
        call matchadd("BlockColor3", '^ \{12}.*', 3, 77883)
        call matchadd("BlockColor4", '^ \{16}.*', 4, 77884)
        call matchadd("BlockColor5", '^ \{20}.*', 5, 77885)
        call matchadd("BlockColor6", '^ \{24}.*', 6, 77886)
    endif
endfunction " }}}
" Default highlights {{{
hi def BlockColor1 guibg=#222222 ctermbg=234
hi def BlockColor2 guibg=#2a2a2a ctermbg=235
hi def BlockColor3 guibg=#353535 ctermbg=236
hi def BlockColor4 guibg=#3d3d3d ctermbg=237
hi def BlockColor5 guibg=#444444 ctermbg=238
hi def BlockColor6 guibg=#4a4a4a ctermbg=239
" }}}
nnoremap <leader>B :call BlockColor()<cr>

" }}}
" Pulse/Blink Line {{{
" TODO?

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

" }}}
" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

	" Construct a literal pattern that has to match at boundaries.
	let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}
" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}
" Open URL in Browser {{{

" Works in MAC OS X
function! HandleURI() "{{{
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction " }}}
map <localleader>u :call HandleURI()<CR>
" Linux {{{
" nnoremap <localleader>u :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>
" }}}
" Dash {{{

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>x :call SearchDash()<CR>"

" }}}
" }}}
" Autoread more often {{{
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
" }}}

" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

	set linespace=3 "Prefer a slightly higher line height

	" set guifont=Inconsolata-dz\ for\ Powerline:h13 " set fonts for gui vim
	set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13 " set fonts for gui vim
	colorscheme badwolf

    " Remove all the UI cruft
	set guioptions=acg
    " set guioptions-=T
    " set guioptions-=l
    " set guioptions-=L
    " set guioptions-=r
    " set guioptions-=R

	" Should set local spell option
    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
    " For me, this means iTerm2, possibly through tmux

    " Mouse support
    set mouse=a
endif

" }}}
" In stasis ----------------------------------------------------------- {{{

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

" }}}
