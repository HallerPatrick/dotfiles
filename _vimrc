set nocompatible

" No sounds
set visualbell
set noerrorbells

filetype plugin indent on

if (has('termguicolors'))
  set termguicolors
endif

" =============================================================================
" # Editor settings
" ============================================================================

set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=8
set noshowmode
set hidden
set nowrap
set nojoinspaces
set relativenumber " Relative line numbers
set number " Also show current absolute line
set shiftwidth=4
set expandtab
" set cc=99
" set list listchars=tab:>\ ,trail:-,eol:↵
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

" set completeopt-=preview

" Permanent Undo
set undodir=~/.vimdid
set undofile

" Allow folding by syntax
set foldmethod=manual

" Delete trailing whitespace on save
" autocmd BufWritePre * %s/\s\+$//e

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

" Quick-save (shave of those ms!)
nmap <leader>w :w<CR>

" Show buffers
nmap <leader>, :Buffers<CR>

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

noremap <leader>tf :TestFile<CR>
noremap <leader>tn :TestNearest<CR>

nmap <leader>b :TagbarToggle<CR>

nnoremap <leader>td :TodoList<CR>
nnoremap <leader>ud :UndotreeToggle<CR>

" nvim terminal shortcut
tnoremap <Esc> <C-\><C-n>

" Disable Ex Mode entering
map q: <Nop>
nnoremap Q <nop>

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

" Fast begin/end of line movement
map H _
map L $

" Move by line
nnoremap j gj
nnoremap k gk

vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '<-2<CR>gv=gv'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wojciechkepka/bogster'

call plug#end()

colorscheme bogster

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

