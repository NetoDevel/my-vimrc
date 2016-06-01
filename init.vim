set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'rainux/vim-desert-warm-256'

" Syntax
Plug 'sheerun/vim-polyglot'

" Indentation
Plug 'Yggdroot/indentLine'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Files
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Utilities
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/ZoomWin'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/YankRing.vim'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'itchyny/vim-cursorword'
Plug 'Shougo/unite.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-textobj-user'
Plug 'godlygeek/tabular'
Plug 'skwp/greplace.vim'
Plug 'henrik/vim-indexed-search'
Plug 'vim-scripts/AnsiEsc.vim', { 'for': 'log' }

" Objects
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'lucapette/vim-textobj-underscore'

"
if executable('ag')
  Plug 'epmatsw/ag.vim'
elseif executable('ack')
  Plug 'mileszs/ack.vim'
endif

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'matthewsimo/angular-vim-snippets'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'

" Rails
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" Ruby
Plug 'gmarik/snipmate.vim', { 'for': ['ruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'lua'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'lucapette/vim-ruby-doc', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby'] }
Plug 'bootleq/vim-textobj-rubysymbol', { 'for': 'ruby' }

" Crystal
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }

" Javascript
Plug 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' }
Plug 'claco/jasmine.vim', { 'for': 'javascript' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'gregsexton/gitv'

" Tmux
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'christoomey/vim-tmux-navigator'
"
call plug#end()

runtime macros/matchit.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

syntax enable
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
imap jj <ESC>
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
set autoread
set undofile
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Make clipboard work with clipboard mac native
set clipboard+=unnamedplus

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
" set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
"set lazyredraw
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set previewheight=20

set t_Co=256
set background=dark
colorscheme desert-warm-256
highlight clear SignColumn
highlight CursorLine term=NONE cterm=NONE ctermbg=236

" make vertical split bar character a space (so not visible)
set fillchars+=vert:\

set splitbelow splitright

" switch to relative numbers in normal mode
autocmd BufLeave * :set norelativenumber
autocmd BufEnter * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set regexpengine=1 " use old, faster, regex engine

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround

set nowrap
set textwidth=79
set formatoptions=n

if exists("+colorcolumn")
  set colorcolumn=80
  highlight ColorColumn ctermbg=236
endif

" display tabs and trailing spaces
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅"

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

set tildeop

"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

" flags
set statusline+=%m%r%h%w
" git branch
set statusline+=\ %{fugitive#statusline()}
" encoding
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
" rvm
if exists("$rvm_path")
  set statusline+=\ %{rvm#statusline()}
end
" path
set statusline=%f
" line x of y
set statusline+=\ [line\ %l\/%L]

" Colour
hi StatusLine ctermfg=Black ctermbg=White
hi StatusLineNC ctermfg=Black ctermbg=Grey

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch

" Begin and Start of the current line easily
noremap H ^
noremap L g_

hi Search ctermfg=NONE ctermbg=NONE cterm=underline


" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" Toggle search highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>

" search (forwards), drops a mark first
nmap <space> /
" search (backwards), drops a mark first
map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Remap move up and down
nnoremap j gj
nnoremap k gk

" To search in files (,a) we can use ack or ag
if executable('ag')
  nnoremap <leader>a :Ag!
  nnoremap <leader>aa :Ag! <cword><CR>
elseif executable('ack')
  nnoremap <leader>a :Ack!
  nnoremap <leader>a :Ack! <cword><CR>
  let g:ackprg="ack -H --nocolor --nogroup --column"
endif

" Auto format
map === gg=G`.

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" TERMINAL
tnoremap <Esc> <C-\><C-n>

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" close buffer
nmap <leader>d :bd<CR>

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" File to ignore for autocomplete, also used by Ctrlp
set wildignore+=*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak,*.tar,*.zip,*.tgz
set wildignore+=*/.hg/*,*/.svn/*,*/.git/*
set wildignore+=*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/solr/data/*,*/.DS_Store

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader><Esc> :q!<CR>

" CTAGS aka autocomplete
" Includes all gems in RVM gemset, excludes Javascript and HTML
"map <leader>rt :!ctags --sort=yes --extra=+f --languages=-javascript --exclude=.git --exclude=log --exclude=db --exclude=public --exclude=alfresco -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

map <leader>rt :call VimuxRunCommand("clear;ctags --sort=yes --extra=+f --languages=-javascript --exclude=.git --exclude=log --exclude=db --exclude=public --exclude=alfresco -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/* &")<CR>


"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'wombat'

" IndentLine
let g:indentLine_char='│'

" FZF (Fuzzy search)
" https://github.com/junegunn/fzf.vim
nmap <leader>f :GitFiles<CR>
nmap <leader>b :Buffers<CR>

" Snippets
" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.config/repos/github.com/matthewsimo/angular-vim-snippets/snippets'

" SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ZoomWin (toggle split to full screen)
map <leader>z :ZoomWin<CR>

" NERDTree
map <leader>p :NERDTreeToggle<cr>
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1

" " Surround
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

" Change inside various enclosures with Cmd-" and Cmd-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <D-'> f'ci'
nnoremap <D-"> f"ci"
nnoremap <D-(> f(ci(
nnoremap <D-)> f)ci)
nnoremap <D-[> f[ci[
nnoremap <D-]> f]ci]


" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`
" "

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

" ============================
" Tabularize - alignment
" ============================
" Hit Cmd-Shift-A then type a character you want to align by
nmap <D-A> :Tabularize /
vmap <D-A> :Tabularize /

" Source current file Cmd-% (good for vim development)
map <D-%> :so %<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,t,i

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

let my_home = expand("$HOME/")

if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" YankRing
let g:yankring_history_dir = '/tmp'

" Fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>i
nmap <leader>gd :Gdiff<CR>
nmap <leader>ga :Git add %<CR>

" GitGutter
let g:gitgutter_map_keys = 0

"  ---------------------------------------------------------------------------
"  Tmux/Rspec
"  ---------------------------------------------------------------------------

" default mappings ,t and ,T for running all specs in buffer and spec on
" current line.

let VimuxUseNearestPane = 1
let VimuxHeight = "40"
let VimuxOrientation = "v"

if exists('$TMUX')

  let g:turbux_command_prefix = 'bundle exec'

  " Run all specs (writes buffer first)
  map <leader>tt ,w:call VimuxRunCommand("clear; bundle exec rspec spec")<CR>

  " Close specs pane
  map <leader>tx :call VimuxRunCommand("clear")<CR>:call CloseVimTmuxPanes()<CR>

  " Clear specs pane
  map <leader>tc :call VimuxRunCommand("clear")<CR>

  " Run shell command
  map <leader>rc :PromptVimTmuxCommand<CR>
endif


"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------

" vim-ruby-doc

let g:ruby_doc_command='open' " MacOS

" Execute current buffer as ruby (Shift + r)
" map <S-r> :w !ruby<CR>

" Skip to Model, View or Controller
map <Leader>m :Rmodel
map <Leader>v :Rview
map <Leader>c :Rcontroller

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=a
  set guifont=Monaco:h12
endif

" Mouse in terminal!!! (good for resizing splits)
if has('mouse')
  set mouse=a
  "set ttymouse=xterm2
endif

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set directory=./.vim-swap,~/tmp/vim,~/.tmp,~/tmp,/tmp
set backupdir=./.vim-backup,~/tmp/vim,~/.tmp,~/tmp,/tmp
set undodir=./.vim-undo,~/tmp/vim,~/.tmp,~/tmp,/tmp

" Ctags path
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .nvimrc source %
autocmd! bufwritepost nvimrc source %
" autocmd! bufwritepost bundles.vim source %

" fix ctrl+h issue of tmuxnator inside nvim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>


" Emmet
" Enable Emmet in all modes
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction
  autocmd FileType html,markdown imap <buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 1
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall

