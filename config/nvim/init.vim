"
" ______     _        _      _                 _
" | ___ \   | |      (_)    | |               (_)
" | |_/ /_ _| |_ _ __ _  ___| | _____   __   ___ _ __ ___  _ __ ___
" |  __/ _` | __| '__| |/ __| |/ / __|  \ \ / / | '_ ` _ \| '__/ __|
" | | | (_| | |_| |  | | (__|   <\__ \   \ V /| | | | | | | | | (__
" \_|  \__,_|\__|_|  |_|\___|_|\_\___/  (_)_/ |_|_| |_| |_|_|  \___|
"
"
" author: Patrick (https://www.github.com/HallerPatrick/dotfiles)
" email: patrickhaller40@googlemail.com
" modified: 12.04.2020
"

set nocompatible

set visualbell
set noerrorbells

filetype off

if (has('termguicolors'))
  set termguicolors
endif

" =============================================================================
" # Editor settings
" ============================================================================

filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set relativenumber " Relative line numbers
set number " Also show current absolute line
set shiftwidth=4
set expandtab

set cc=99

" Use clipboard all the time
set clipboard+=unnamedplus

set mouse=a

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set ttyfast
set lazyredraw

" Allow folding by syntax
set foldmethod=manual
set nofoldenable    " disable folding

set completeopt-=preview

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ======================================================
" ==== Leader Mapping ==================================
" ======================================================

let mapleader = "\<Space>"

" Fast closing
noremap <leader>q :q<cr>

" <leader>s for Rg search
noremap <leader>s :Rg<cr>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Quick-save
nmap <leader>w :w<CR>

" Show buffers
nmap <leader>, :Buffers<CR>

" Copy & Paste to system Clipboard with <Space>p and <Space>y
map <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" set nohlsearch
map <leader>h :noh<cr>

map <leader>f :Files<cr>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bd<CR>

" Vsplit shortcut
nnoremap <leader>v :vsplit <cr>

" Vaster vertical resizing
noremap <silent> <leader><Left> :vertical resize -3<CR>
noremap <silent> <leader><Right> :vertical resize +3<CR>

noremap <leader>tt :vnew term://zsh<CR>

nmap <leader>b :TagbarToggle<CR>

" nvim terminal shortcut
tnoremap <Esc> <C-\><C-n>

" ======================================================
" ==== Remapping
" ======================================================

" v spam for selecting
vmap v eS

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" No arrow keys --- force yourself to use the home row
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>


" Fast begin/end of line movement
map H _
map L $

" Move by line
nnoremap j gj
nnoremap k gk

vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '<-2<CR>gv=gv'

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Autoinstall Plug if not existing (only Neovim)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Linter Engine
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pechorin/any-jump.vim'

"Visual
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'unblevable/quick-scope'
Plug 'preservim/tagbar'

" Utilities
Plug 'airblade/vim-rooter'
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'chrisbra/unicode.vim'
Plug 'AndrewRadev/splitjoin.vim'

" Language stuff
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fisadev/vim-isort'
Plug 'liuchengxu/vista.vim'
Plug 'vim-test/vim-test'

" Plug 'kaicataldo/material.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'skbolton/embark'
" Plug 'Rigellute/rigel'
" Plug 'bluz71/vim-nightfly-guicolors'
Plug 'pineapplegiant/spaceduck'


Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Markdown
Plug 'gabrielelana/vim-markdown'

" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }


Plug 'metakirby5/codi.vim'

" Fuzzy Search
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf'

" Commenting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'


" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Better visual selection
Plug 'terryma/vim-expand-region'


" A Vim Plugin for Lively Previewing LaTeX PDF Output
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'HerringtonDarkholme/yats.vim'


call plug#end()


" Maybe
" set rtp+=/usr/local/opt/fzf

" colorscheme material
" colorscheme xcodedark
" colorscheme material
" colorscheme nord
colorscheme spaceduck
" colorscheme embark
" colorscheme rigel

let test#pyton#runner = 'pytest'
let g:rigel_lightline = 1

let g:lightline = { 'colorscheme': 'spaceduck' }

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']


vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1

let g:UltiSnipsSnippetDirectories=["UltiSnips", "ulti_snippets"]

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let test#python#runner = 'pytest'

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

set tabstop=4

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

" Ale Extras
"
let g:ale_linters = {
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'typescriptreact': ['prettier'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt'],
  \    'python': ['black']
\}
let g:ale_fix_on_save = 1

" THIS SHOULD ALWAYS BE SET NEW ON EVERY MACHINE
let g:python3_host_prog = '/Users/patrickhaller/.pyenv/versions/neovim3/bin/python'

let g:rust_use_custom_ctags_defs = 1

let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" GoTo Definition ShortCut
nnoremap <up> <nop>

let g:rustfmt_autosave = 1

" Open pdf with preview
let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'pdflatex'

" FORMATTERS for Web
au FileType javascript setlocal formatprg=prettier shiftwidth=2 softtabstop=2 expandtab
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 expandtab

" Permanent Undo

set undodir=~/.vimdid
set undofile

" Allow folding by syntax
set foldmethod=manual

