set nocompatible

call pathogen#incubate()
call pathogen#helptags()

" color settings (solarized)
let g:solarized_diffmode="high"
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
colorscheme solarized
call togglebg#map("<Leader>tb")

set mouse=a
filetype plugin on
filetype indent on

" appereance
syntax on
set nonumber
set relativenumber
set cursorcolumn
set cursorline
set wrap
set linebreak
set showbreak=…
set grepprg=grep\ -nH\ $*
set scrolloff=7
set list
set listchars=tab:\ \ ,trail:·
set diffopt+=iwhite

" indention
set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
vnoremap < <gv
vnoremap > >gv
let g:PHP_autoformatcomment = 0

" autocomplete
set infercase

" undo- and backupfiles
set directory=~/.vim/backupdir//
set undodir=~/.vim/undodir//
set undofile

" statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set showcmd

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <Leader>s :nohlsearch<CR>
set incsearch
set gdefault
vnoremap / <esc>/\%V

" remove trailing spaces
nnoremap <Leader>wr :%s/\s\+$//e<CR>

" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//c<left><left><left>

" lazy commands
nnoremap <Space> :
vnoremap <Space> :
inoremap jk <Esc>

if has("autocmd")
  " Drupal php files.
  augroup module
    autocmd BufRead,BufNewFile *.{module,install,test,inc,profile} set filetype=php
    autocmd BufRead,BufNewFile *.{info,make,build} set filetype=dosini
    autocmd BufRead,BufNewFile *.{module,install,test,inc,profile,php} setlocal formatoptions=clorq
    autocmd BufRead,BufNewFile *.{module,install,test,inc,profile,php} setlocal comments=s1:/*,mb:*,ex:*/,://,:#
    autocmd FileType php setlocal textwidth=80
  augroup END
endif
