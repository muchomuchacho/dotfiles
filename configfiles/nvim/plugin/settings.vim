scriptencoding utf-8

set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/tmp/backup     " keep backup files out of the way
  set backupdir+=.
endif

if has('wildignore')
  set backupskip+=*.re,*.rei          " prevent bsb's watch mode from getting confused
endif

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

if exists('+colorcolumn')
    " Highlight up to 255 columns (this is the current Vim max) beyond
    " textwidth
    let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set cursorline

if exists('$SUDO_USER')
    set noswapfile
else
    set directory=~/.vim/tmp/swap//      " keep swap files out of the way
    set directory+=.
endif

set formatoptions+=j                " remove comment leader when joining comment lines

set formatoptions+=n                  " smart auto-indenting inside numbered lists

set guioptions-=T                     " don't show toolbar
set hidden                            " allows you to hide buffers with unsaved changes without being prompted

if !has('nvim')
  " Sync with corresponding nvim :highlight commands in ~/.vim/plugin/autocmds.vim:
  set highlight+=@:Conceal            " ~/@ at end of window, 'showbreak'
  set highlight+=D:Conceal            " override DiffDelete
  set highlight+=N:FoldColumn         " make current line number stand out a little
  set highlight+=c:LineNr             " blend vertical separators with line numbers
endif

if exists('&inccommand')
  set inccommand=split                " live preview of :s results
endif

set laststatus=2                      " always show status line
set lazyredraw                        " don't bother updating screen during macro playback

if has('linebreak')
  set linebreak                       " wrap long lines at characters in 'breakat'
endif

set list
set listchars=nbsp:⦸
set listchars+=tab:▷┅
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•

set modelines=5                       " scan this many lines looking for modeline
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set number                            " show line numbers in gutter

if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shell=sh                          " shell to use for `!`, `:!`, `system()` etc.
set shiftround                        " always indent by multiple of shiftwidth
set shiftwidth=2                      " spaces per tab (when shifting)
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
if has('patch-7.4.314')
  set shortmess+=c                    " completion messages
endif
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('linebreak')
  let &showbreak='↳ '                 " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

if has('showcmd')
  set noshowcmd                       " don't show extra info at end of command line
endif

set sidescroll=0                      " sidescroll in jumps because terminals are slow
set sidescrolloff=3                   " same as scrolloff, but for columns
set smarttab                          " <tab>/<BS> indent/dedent in leading whitespace

if v:progname !=# 'vi'
  set softtabstop=-1                  " use 'shiftwidth' for tab/bs at end of line
endif

if has('syntax')
  set spellcapcheck=                  " don't check for capital letters at start of sentence
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

if exists('&swapsync')
  set swapsync=                       " let OS sync swapfiles lazily
endif
set switchbuf=usetab                  " try to reuse windows/tabs when switching buffers

if has('syntax')
  set synmaxcol=200                   " don't bother syntax highlighting long lines
endif

set tabstop=2                         " spaces per tab

if has('termguicolors')
  set termguicolors                   " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif

set textwidth=80                      " automatically hard wrap at 80 columns

" Colorscheme section
set background=dark
colorscheme gruvbox

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo       " keep undo files out of the way
    set undodir+=.
    set undofile                      " actually use undo files
  endif
endif

set updatecount=80                    " update swapfiles every 80 typed chars
set updatetime=2000                   " CursorHold interval

if has('viminfo') " ie. Vim.
  let s:viminfo='viminfo'
elseif has('shada') " ie. Neovim.
  let s:viminfo='shada'
endif

if exists('s:viminfo')
  if exists('$SUDO_USER')
    " Don't create root-owned files.
    execute 'set ' . s:viminfo . '='
  else
    " Defaults:
    "   Neovim: !,'100,<50,s10,h
    "   Vim:    '100,<50,s10,h
    "
    " - ! save/restore global variables (only all-uppercase variables)
    " - '100 save/restore marks from last 100 files
    " - <50 save/restore 50 lines from each register
    " - s10 max item size 10KB
    " - h do not save/restore 'hlsearch' setting
    "
    " Our overrides:
    " - '0 store marks for 0 files
    " - <0 don't save registers
    " - f0 don't store file marks
    " - n: store in ~/.vim/tmp
    "
    execute 'set ' . s:viminfo . "='0,<0,f0,n~/.vim/tmp/" . s:viminfo

    if !empty(glob('~/.vim/tmp/' . s:viminfo))
      if !filereadable(expand('~/.vim/tmp/' . s:viminfo))
        echoerr 'warning: ~/.vim/tmp/' . s:viminfo . ' exists but is not readable'
      endif
    endif
  endif
endif

if has('mksession')
  set viewdir=~/.vim/tmp/view         " override ~/.vim/view default
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

set visualbell t_vb=                  " stop annoying beeping for non-error errors
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                   " substitute for 'wildchar' (<Tab>) in macros
if has('wildignore')
  set wildignore+=*.o,*.rej           " patterns to ignore during file-navigation
endif
if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif

set wildmode=longest,list   " get bash-like tab completions

