set nocompatible
let maplocalleader="\\"
let mapleader=" "
set path+=**
set tabstop=3
set shiftwidth=3
set wildmenu
set wildmode=list:longest,full
set incsearch
set wildignorecase
set nobackup
set nowritebackup
set noswapfile
set smartindent
set autoindent
filetype plugin indent on
set number
set relativenumber
syntax on 
syntax enable
colorscheme murphy
set showcmd

set laststatus=2
set statusline=%(%2*%m%w%k%q\%*\%)%(%6*%<%f%*%)\%=%a%-4y%(\ %5*\ %n\ %*%)\%(%4*\ %l%*/%3*%L\ %*%1*%P%*%)
hi User6 ctermfg=15 ctermbg=236
hi User3 ctermfg=82 ctermbg=236
hi User2 ctermfg=202 ctermbg=0
hi User5 ctermbg=243 ctermfg=1
hi User1 ctermfg=15 ctermbg=236
hi StatusLine ctermfg=15 ctermbg=236 cterm=bold
hi StatusLineNC ctermfg=15 ctermbg=238 cterm=bold

augroup foldmethod
	autocmd!
	autocmd FileType * setlocal foldmethod=marker
	augroup END

augroup wraptext
autocmd!
autocmd FileType * vnoremap <buffer> <localleader>' :<c-u>s/\%V.*\%V/'&'/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>" :<c-u>s/\%V.*\%V/"&"/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>[ :<c-u>s/\%V.*\%V/[&]/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>{ :<c-u>s/\%V.*\%V/{&}/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>( :<c-u>s/\%V.*\%V/(&)/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>< :<c-u>s/\%V.*\%V/(&)/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>.' :<c-u>s/\%V'\(.*\)\%V'/\1/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>." :<c-u>s/\%V"\(.*\)\%V"/\1/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>.] :<c-u>s/\%V\[\(.*\)\%V\]/\1/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>.} :<c-u>s/\%V{\(.*\)\%V}/\1/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>.) :<c-u>s/\%V(\(.*\)\%V)/\1/g<CR>
autocmd FileType * vnoremap <buffer> <localleader>.> :<c-u>s/\%V(\(.*\)\%V)/\1/g<CR>
augroup END


nnoremap <Localleader>v :version<CR>
nnoremap <Localleader>u :undolist<CR>
nnoremap <Localleader>a :args<CR>
nnoremap <Localleader>n :Vex<CR>
nnoremap <Localleader>r :registers<CR>
nnoremap <Localleader>j :jumps<CR>
nnoremap <Localleader>k :marks<CR>
nnoremap <Localleader>b :buffers<CR>
nnoremap <Localleader>h :history<CR>
nnoremap <Localleader>m :messages<CR>
nnoremap <Localleader>q q/
nnoremap <Localleader>c :changes<CR>

nnoremap <Localleader>_ <C-w>c
nnoremap <Localleader>+ :write!<CR>
nnoremap <Localleader>- :quit!<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap £ <C-d>zz
nnoremap ¥ <C-u>zz
inoremap jk <ESC>
vnoremap jk <esc>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"Source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>


command! -nargs=1 Help !lynx https://vimhelp.org/<args>.txt.html
