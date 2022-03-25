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
lua require("init")

let g:lsc_auto_map = v:true

let test#pyton#runner = 'pytest'


" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

let g:UltiSnipsSnippetDirectories=["UltiSnips", "ulti_snippets"]


if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

set tabstop=4

" Some servers have issues with backup files, see #649
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

" THIS SHOULD ALWAYS BE SET NEW ON EVERY MACHINE
let g:python3_host_prog = '/Users/patrickhaller/.pyenv/versions/neovim3/bin/python'

let g:rustfmt_autosave = 1

autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType lv setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" highglight yanked group
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" au BufWritePost <buffer> lua require('lint').try_lint()
" command! -nargs=0 Lint lua require("lint").try_lint()
