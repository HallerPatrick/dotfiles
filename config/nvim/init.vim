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

filetype off

if (has('termguicolors'))
  set termguicolors
endif

let g:clipboard="xclip"
let g:NVIM_PYTHON_LOG_FILE="~/nvim_python_log.log"
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
set cc=100

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

"Visual
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'

" Utilities
Plug 'airblade/vim-rooter'
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Plug 'kaicataldo/material.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Rigellute/rigel'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocompletion
" Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Markdown
Plug 'gabrielelana/vim-markdown'

" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }


" Fuzzy Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'


" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Better visual selection
Plug 'terryma/vim-expand-region'


" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug '~/Projects/nvim-python-coverage'

call plug#end()


" Maybe
" set rtp+=/usr/local/opt/fzf

" colorscheme material
" colorscheme xcodedark
" colorscheme material
colorscheme nord
" colorscheme rigel

let g:rigel_lightline = 1

let g:lightline = { 'colorscheme': 'rigel' }

" If luajit not existing
lua << EOF
if jit ~= nil then
    require'colorizer'.setup()
end
EOF

let g:python3_host_prog = expand('/usr/bin/python3')

let g:deoplete#enable_at_startup = 1

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

let test#python#runner = 'nose'

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

" =============================================================================
" # CoC settings
" ============================================================================
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `omplete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Ale Extras
"
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt'],
  \    'python': ['black']
\}
let g:ale_fix_on_save = 1

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

