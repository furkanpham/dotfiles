syntax on " syntax highlighting

"==================================
" general
"==================================
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab		 " expand tabs to spaces
autocmd FileType make setlocal noexpandtab      " makefiles use tabs instead of spaces

" disable vi compatibility
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" turn line numbers on
set number
set relativenumber

" highlight matching braces
set showmatch

" highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+$/

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" disable italicizing characters for tex files
autocmd FileType tex hi clear texItalStyle

" disable automatic comment insertions
autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn

"==================================
" editing
"==================================
" new line inserts
nnoremap <return> o<esc>

"==================================
" navigation
"==================================
nnoremap <c-j> <c-f>
nnoremap <c-k> <c-b>

" window cycling
nnoremap <tab> <c-w>w
nnoremap <s-tab> <c-w>W

"==================================
" tmux
"==================================
" Always view statusline
set laststatus=2
