"==================================
" pathogen plugin manager; https://github.com/tpope/vim-pathogen
"==================================
execute pathogen#infect()
syntax on " syntax highlighting

"==================================
" general
"==================================
" force vim to source .vimrc file if it's present in working directory
set exrc
set secure

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab		 " expand tabs to spaces
autocmd FileType make setlocal noexpandtab      " makefiles use tabs instead of spaces
" autocmd FileType tex setlocal tabstop=2         " tex files use 2 spaces
" autocmd FileType tex setlocal shiftwidth=2      " ''

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
autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=blue
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" disable italicizing characters for tex files
autocmd FileType tex hi clear texItalStyle

" disable automatic comment insertions
autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn

" use arduino syntaxes
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

"==================================
" editing
"==================================
" new line inserts
nnoremap <return> o<esc>

" remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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
" set t_Co=8 " 256 colors with tmux
set t_Co=24 " 16million colors with tmux

" tmux optimization
set ttyfast
set lazyredraw

" Always view statusline
set laststatus=2

"==================================
" vim-airline settings
"==================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='term'

"==================================
" theming
"==================================
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
colorscheme default
