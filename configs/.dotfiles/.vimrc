set nocompatible
let mapleader = "\"
let maplocalleader = '<bs>'
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

augroup filetype_*
	autocmd!
	autocmd FileType * setlocal foldmethod=marker
augroup END
augroup modal_cursor
	autocmd!
	autocmd InsertEnter * highlight CursorLine ctermbg=17
	autocmd InsertLeave * highlight CursorLine ctermbg=none
augroup END

augroup filetype *
	autocmd!
	autocmd FileType .md setlocal 
	autocmd FileType ja:vascript nnoremap <buffer> <localspace>c I//<esc>
	autocmd FileType python     nnoremap <buffer> <localspace>c I#<esc>
augroup END

augroup filetype_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
augroup END

nnoremap <leader>h :silent execute "help " . expand("<cword>") <Bar> echo "Help topic not found: " . expand("<cword>")<CR>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>< ciw<"></"><Esc>F<
nnoremap <leader>html :read >

nnoremap <Localleader>v :version<CR>
nnoremap <Localleader>u :undolist<CR>
nnoremap <Localleader>a :args<CR>
nnoremap <Localleader>. :Vex<CR>
nnoremap <Localleader>" :registers<CR>
nnoremap <Localleader>j :jumps<CR>
nnoremap <Localleader>' :marks<CR>
nnoremap <Localleader>b :buffers<CR>
nnoremap <Localleader>h :history<CR>
nnoremap <Localleader>! :messages<CR>
nnoremap <Localleader>q q/
nnoremap <Localleader>; :changes<CR>

nnoremap <Localleader>_ <C-w>_
nnoremap <Localleader>+ :write!<CR>
nnoremap <Localleader>x :quit!<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap £ <C-d>zz
nnoremap ¥ <C-u>zz
inoremap jk <ESC>
vnoremap jk <esc>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
}}}

 Open .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
 Source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>


command! -nargs=1 Help !lynx https://vimhelp.org/<args>.txt.html
