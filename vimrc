" Author: Alex Ciobica <alex.ciobica@gmail.com>
" Inspiration form: Steve Losh, Jeffrey Way, Derek Wyatt

" `zR` to open all folds ಠ‿ಠ
" `zM` to close all folds ಠ_ಠ
" `za` to open current fold

" Be IMproved
set nocompatible

" ------------------
" Basic options  {{{

"
" General

syntax on
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
set hidden " Switch between buffers without saving
set number " Show lines numbers
set ttyfast " I have a fast terminal
set lazyredraw " Don't redraw screen while executing macros
set undofile " Save undo history in a file
set splitbelow " H split below
set splitright " V split to the right
set title " Show the title in window bar
set colorcolumn=+1 " Highlight the textwidth column
set linebreak " Wrap long lines at characters in 'breakat'
set laststatus=2 "Always show the status line
set synmaxcol=800 " Don't highlight lines longer than 800 characters.
set autoread
set mousehide "Hide mouse when typing
set shell=/bin/zsh
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=50

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Resize splits when the window is resized
au VimResized * :wincmd =

" Syntax
au BufRead,BufNewFile *.wiki set syntax=wiki
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.sls set ft=sls syntax=sls
au BufRead,BufNewFile *.jinja set ft=sls syntax=sls
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" Highlight version control conflict markers
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

"
" Tabs, spaces, wrapping

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set wrap " as opposed to nowrap
set formatoptions=qrn1
au BufNewFile,BufRead *.php setlocal tabstop=4
au BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.php setlocal noexpandtab
au BufNewFile,BufRead *.js,*.py,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2

"
" Wildmenu (Command line) completion

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" " Make sure Vim returns to the same line when you reopen a file.
" augroup line_return
"     au!
"     au BufReadPost *
"         \ if line("'\"") > 0 && line("'\"") <= line("$") |
"         \     execute 'normal! g`"zvzz' |
"         \ endif
" augroup END

"
" Backups

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
" --------------------------
" Environments (GUI/Console) {{{

" Different cursors for different modes.
set guicursor=n-c:block-Cursor-blinkon0
set guicursor+=v:block-vCursor-blinkon0
set guicursor+=i-ci:ver20-iCursor

if has('gui_running')
    " GUI Vim

	set linespace=1 "Prefer a slightly higher line height
	" set guifont=Inconsolata-g\ for\ Powerline:h14 " set fonts for gui vim
	set guifont=M+\ 1m\ regular\ for\ Powerline:h15 " set fonts for gui vim
	" set linespace=6 "Prefer a slightly higher line height
	" set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14 " set fonts for gui vim

    " Remove all the UI cruft
	set guioptions=acg
    " set guioptions-=T
    " set guioptions-=l
    " set guioptions-=L
    " set guioptions-=r
    " set guioptions-=R

	" Should set local spell option
    highlight SpellBad term=underline gui=undercurl guisp=Orange

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
" --------------------------
" Searching and movement {{{

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

" Don't move on *
nnoremap * *<c-o>

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

" Directional Keys

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

"
" Visual Mode */# from Scrooloose

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

"
" Quickfix / Location navigation

nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz

" }}}
" -----------
" Folding {{{

set foldenable "Enable code folding
set foldlevelstart=0

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

" Change how the fold looks
function! MyFoldText() "
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
endfunction "
set foldtext=MyFoldText()

"
" Filetype-specific

" vimrc
augroup vimrc
    au!

    au BufNewFile,BufRead .virmc setlocal foldmethod=marker

augroup END

" HTML
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

" JavaScript
augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" MarkDown
augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    au BufNewFile,BufRead .virmc setlocal foldmethod=marker

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><ESC>`z4l
augroup END

" Vim
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" -------------------
" Custom mappings {{{

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" CD to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Select latest paste
nnoremap gp `[v`]

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Source .vimrc and leave the coursor in place.
nmap <leader>eev <cr>mz:source $MYVIMRC<cr>`z

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Panic Button!!!
nnoremap <f9> mzggg?G`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" I keep pressing the damn shift
cnoremap W<cr> w<cr>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Quick editing
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>eb :tabedit ~/.vim/rc_extras/vundles.vim<cr>
nnoremap <leader>eh :tabedit ~/.vim/vim-shortcuts.txt<cr>
nnoremap <leader>es :tabedit ~/.vim/rc_extras/transient.vim<cr>

" }}}
" ----------
" Vundle {{{

    filetype off " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Let Vundle manage Vundle (required!)
    Plugin 'gmarik/vundle'
    source ~/.vim/rc_extras/vundles.vim " Include my bundles
    filetype plugin indent on " required

" }}}
" ----------------
" Mini-Plugins {{{
" Stuff that should probably be broken out into plugins, but hasn't proved to be
" worth the time to do so just yet.

    " Pulse/Blink Line {{{

    function! s:Pulse() "
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
    endfunction "
    command! -nargs=0 Pulse call s:Pulse()

    " }}}

    " Autoread more often {{{
    "
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
