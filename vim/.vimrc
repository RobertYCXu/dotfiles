" Filetype detection
filetype plugin on

" Set autoread when file changed outside
set autoread

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Saving
nmap <leader>w :w!<cr>
nmap <leader>e :q<cr>

" Wildmenu
set wildmenu

" Show ruler (bottom right)
set ruler

" Ignore case when searching
set ignorecase

" Smart case
set smartcase

" Highlight search results
set hlsearch

" Modern search
set incsearch

" Don't redraw when executing macros (performance)
set lazyredraw

" Turn on magic for regex
set magic

" Show matching brackets
set showmatch

" How many tenths of seconds to blink when matching brackets
set mat=0

" No annoying sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Syntax highlighting
syntax on

" utf8 encoding
set encoding=utf8

" Tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Indentation
set tw=99
set smartindent
set autoindent
filetype indent on

" Turn off backup
set nobackup
set nowb
set noswapfile

" Display
set number relativenumber
set colorcolumn=100
set hidden
set history=500

" Don't match autocomplete from included files
set complete-=i

" Search in real time
set incsearch

" Autoread
set autoread

" Sensible backspace
set backspace=indent,eol,start

" Always have a line after cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Prettify visible whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Buffers
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch to last buffer
map <leader>f :b#<cr>

" Vim
map <leader>vimrc :e ~/.vimrc<cr>
map <leader>sv :source ~/.vimrc<cr>

" FZF
map ff :FZF<cr>

" Grep
map <leader>g :grep -InHr

" Clipboard
" Copy file to clipboard
map <leader>ca :%w !pbcopy<cr><cr>

" Copy selection to clipboard
map <leader>cp :w !pbcopy<cr><cr>

" Run file
nnoremap <leader>r :!"%:p"

" Open in chrome
map <leader>gc :!open % -a Google\ Chrome<cr>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear highlights
nnoremap <leader>l :noh<cr><esc>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Delete trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Remap VIM 0 to first non-blank character
map 0 ^

" Line display toggle
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" DelimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"FZF
set rtp+=~/.fzf

" Color
packadd! palenight
colorscheme palenight
