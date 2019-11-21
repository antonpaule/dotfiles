"========================================================================
" NeoBundle Plugin Manager
"========================================================================
" Disable vi-compatibility
set nocompatible

"========================================================================
" Neobundle
"========================================================================
if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Use make command across systems
let g:make = 'gmake'
if system('uname -s') =~ '^GNU/'
let g:make = 'make'
endif

" Interactive command execution in Vim.
NeoBundle 'Shougo/vimproc', { 'build': {
  \   'windows': 'make -f make_mingw32.mak',
  \   'cygwin': 'make -f make_cygwin.mak',
  \   'mac': 'make -f make_mac.mak',
  \   'unix': 'make -f make_unix.mak',
  \ } }

" Unite + plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neoyank.vim'

" Fuzzy search
NeoBundle 'mileszs/ack.vim'

" Marks
NeoBundle 'airblade/vim-gitgutter'

" Code completion and formatting
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rhysd/vim-clang-format'

" Comments
NeoBundle 'scrooloose/nerdcommenter'

" Tags
NeoBundle 'majutsushi/tagbar'

" File browsing
NeoBundle 'scrooloose/nerdtree'

" Git
NeoBundle 'tpope/vim-fugitive'

" Motions
NeoBundle 'Lokaltog/vim-easymotion'

" Status line
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'

" Color themes
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
NeoBundle 'w0ng/vim-hybrid'

" Text Objects
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'godlygeek/tabular'

" Tmux
NeoBundle "christoomey/vim-tmux-navigator"

" Misc
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'sjl/gundo.vim'

" cht.sh
NeoBundle 'dbeniamine/cheat.sh-vim'

" Rust
NeoBundle 'rust-lang/rust.vim'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck

"===============================================================================
" General Settings
"===============================================================================

" Set augroup
augroup MyAutoCmd
    autocmd!
  augroup END

syntax on

" Turn on the mouse, since it doesn't play well with tmux anyway. This way I can
" scroll in the terminal
set mouse=a

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line numbers
set number

" Always splits to the right and below
set splitright
set splitbelow

" set vim backround color to terminal background color
let g:hybrid_use_Xresources = 1

" 256bit terminal
set t_Co=256

" Colorscheme
colorscheme Tomorrow-Night

" Airline theme
" let g:airline_theme="tomorrow"

" Tell Vim to use dark background
set background=dark

" Sets how many lines of history vim has to remember
set history=10000

" Set the auto read when a file is changed from the outside
set autoread

" Set to auto write file
"set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup MyAutoCmd
autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=15

" Set Cursor line
set cursorline

" How many lines to scroll at a time, make scrolling appear faster
set scrolljump=3

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Set sensible heights for splits
set winheight=30
set winwidth=30

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Don't show matching brackets
set noshowmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
" Colorcolumn in insert mode only
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=100
  autocmd InsertLeave * setlocal colorcolumn=0
augroup END


" Fix meta-keys which generate <Esc>A .. <Esc>z
if !has('gui_running')
  " let c='a'
  " while c <= 'z'
try
  lang en_us
catch
endtry

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" Text display settings
set linebreak
set textwidth=100
set autoindent
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing
set whichwrap+=h,l,<,>,[,]

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" Use a low updatetime. This is used by CursorHold
set updatetime=1000

" I like my word boundary to be a little bigger than the default
" FIXME Apparently this affects html indenting. Figure out what the problem is
" set iskeyword+=<,>,[,],:,-,`,!
" set iskeyword-=_

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
endif

"===============================================================================
" Function Key Mappings
"===============================================================================

" <F1>: Help
nmap <F1> [unite]h

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

" <F4>: Save session
"nnoremap <F4> :<C-u>UniteSessionSave<CR>

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" <Leader>``: Force quit all
"nnoremap <Leader>`` :qa!<cr>

" <Leader>0: Run the visually selected code in python and replace it with the
" output
"vnoremap <silent> <Leader>0 :!python<cr>

" <Leader>1: Toggle between paste mode
"nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>2: Toggle Tagbar
nnoremap <silent> <Leader>2 :TagbarToggle<cr>

" <Leader>tab: Toggles NERDTree
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>

" <Leader>w: Close current buffer
nnoremap <Leader>w :NERDTreeClose<cr>:bdelete<cr>

" <Leader>r: QuickRun's default keymap

" <Leader>t: TODO

" <Leader>y: TODO

" <Leader>u: TODO

" <Leader>o: only
nnoremap <Leader>o :only<cr>

" <Leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
\ path '".expand("%:p")."' to clipboard"<cr>

" <Leader>a: TODO

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

" <Leader>d: TODO

" <Leader>f: Open Quickfix
nnoremap <silent> <Leader>f :botright copen<CR>

" <Leader>g: Fugitive shortcuts

" <Leader>z: TODO

" <Leader>x: TODO

nnoremap <Leader>/ :LustyBufferGrep<CR>

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" <Leader>v: TODO

" <Leader>b: TODO

" <Leader>n: NERDTreeFind
nnoremap <silent> <Leader>n :NERDTreeFind<cr> :wincmd p<cr>

" <Leader>m: Maximize current split
nnoremap <Leader>m <C-w>_<C-w><Bar>

" <Leader><space>: TODO

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>

" Tmux navigator
if exists(":TmuxNavigateLef")
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-/> :TmuxNavigatePrevious<cr>
endif

nmap =j :%!python -m json.tool<CR>

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================

" Toggle folding around last search result
nmap <silent> <expr> zz FS_ToggleFoldAroundSearch({'context':1})

" Leave Ex Mode, for good
nnoremap Q <nop>

"===============================================================================
" Normal Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-u: Scroll half a screen up smoothly
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

"===============================================================================
" YouCompleteMe Configuration
"===============================================================================
let g:ycm_filetype_blacklist = {
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'text' : 1,
  \ 'unite' : 1
  \}

" Add preview string to Vim's completeopt option
let g:ycm_add_preview_to_completeopt = 1

" Defines where GoTo* commands should be opened
let g:ycm_goto_buffer_command = 'vertical-split'

" Mapping for full diagnostic
let g:ycm_key_detailed_diagnostics = '<leader>D'

" Don't ask for permission for loading ycm_extra_conf.py files
let g:ycm_confirm_extra_conf = 0

" GoTo* commands key mappings
nnoremap <leader>jd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jD :YcmCompleter GoToDeclaration<cr>

nnoremap <leader>gt :YcmCompleter GetType<cr>
nnoremap <leader>gp :YcmCompleter GetParent<cr>

"===============================================================================
" ClangFormat Configuration
"===============================================================================
" set default code style
let g:clang_format#code_style = 'llvm'

" set auto formatting on saving the buffer
let g:clang_format#auto_format = 0

" [C,C++,ObjC] set Vim's format mappings (e.g gq) to use clang-format to format
let g:clang_format#auto_formatexpr = 0


"===============================================================================
" vim-gitgutter configuration
"===============================================================================
let g:gitgutter_realtime = 0


"===============================================================================
" EasyMotion configuration
"===============================================================================
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s)

let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

"===============================================================================
" Unite Configuration
"===============================================================================
" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
" call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
    \ '\.git/',
    \ 'git5/.*/review/',
    \ 'google/obj/',
    \ 'tmp/',
    \ '.sass-cache',
    \ 'node_modules/',
    \ 'bower_components/',
    \ 'dist/',
    \ '.git5_specs/',
    \ '.pyc',
    \ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers buffer<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets ultisnips<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick find
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()
nmap <buffer> <ESC> <Plug>(unite_exit)
nmap <buffer> <ESC> <Plug>(unite_insert_enter)
imap <buffer> <ESC> <Plug>(unite_exit)

imap <buffer> <c-j> <Plug>(unite_select_next_line)
imap <buffer> <c-j> <Plug>(unite_insert_leave)
imap <buffer> <c-k> <Plug>(unite_insert_leave)

nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)

imap <buffer> <C-w> <Plug>(unite_delete_backward_word)

imap <buffer> '     <Plug>(unite_quick_match_default_action)
nmap <buffer> '     <Plug>(unite_quick_match_default_action)

nnoremap <silent><buffer><expr> i unite#do_action('split')
nnoremap <silent><buffer><expr> s unite#do_action('vsplit')

endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

let g:unite_data_directory = "~/.unite"

" Highlights
"let g:unite_cursor_line_highlight = 'CursorLine'

" Set up coolguy arrow promt
let g:unite_prompt = '➜ '

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"


" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" For ack.
if executable('ack-grep')
let g:unite_source_grep_command = 'ack-grep'
" Match whole word only. This might/might not be a good idea
let g:unite_source_grep_default_opts = '--no-heading --no-color'
let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '--no-heading --no-color'
let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_rec_max_cache_files = 1000
