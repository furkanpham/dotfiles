" Plugins
execute pathogen#infect()
filetype plugin indent on

" Searches and highlights
syntax on
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " case insenstive searching
set smartcase       " override ignorecase if search pattern contains upper case
" highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/

" Whitespace and indenting
set wrap                                " wrap lines
set expandtab                           " insert blanks instead of tabstop
set smarttab
set tabstop=4 shiftwidth=4              " one tab is 4 blanks
set autoindent
set smartindent
set comments=sl:/*,mb:\ *,elx:\ */

" Show current position
set ruler

" Remove highlighted search results
map <Space> :noh<cr>

" Performance optimization, don't redraw while executing macros
set lazyredraw
set ttyfast

" Highlight matching braces
set showmatch

" Color options
set t_Co=256
set background=dark
colorscheme desert
highlight Search cterm=NONE ctermfg=black ctermbg=yellow


" Set default encoding to utf8
set encoding=utf-8

" makefiles use tabs instead of spaces
autocmd FileType make setlocal noexpandtab

" Map <tab> to cycle between windows
nnoremap <tab> <c-w>w
nnoremap <s-tab> <c-w>W

" Always show statusline
set laststatus=2

" Linenumber options
set number
set relativenumber

" Map <Enter> to new line inserts
nnoremap <return> o<esc>

" Map <F5> to remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" disable italicizing characters for tex files
autocmd FileType tex hi clear texItalStyle

" disable automatic comment insertions
autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn

" Plugin vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='term'
