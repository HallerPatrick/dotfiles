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


" Unused for now

Plug 'rust-lang/rust.vim'
Plug 'kaicataldo/material.vim'


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


" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Better visual selection
Plug 'terryma/vim-expand-region'


" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Easy motion
Plug 'easymotion/vim-easymotion'

Plug 'liuchengxu/vista.vim'

call plug#end()


" Maybe
" set rtp+=/usr/local/opt/fzf

" colorscheme material
" colorscheme xcodedark
colorscheme material


if has('mac')
    let g:python3_host_prog = expand('/usr/local/bin/python3.7')
endif

let g:deoplete#enable_at_startup = 1

" Completion with tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
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
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

set statusline^=%{coc#status()}
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


