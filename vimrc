call pathogen#infect()

set backspace=indent,eol,start

syntax on

set ts=2
set sw=2
set et

set autowrite

set textwidth=79
set colorcolumn=+1
:hi ColorColumn guibg=#2d2d2d ctermbg=246

set tags=./tags,tags
set laststatus=2
set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l\ (%P\ of\ %L)

filetype plugin on
set omnifunc=syntaxcomplete#Complete

au FileType gitcommit set tw=72 ts=4 sts=2

:nnoremap <leader>m :silent !open -a 'Marked 2.app' '%:p'<cr>

au FileType javascript :noremap <S-F6> :TernRename<cr>
au FileType javascript :inoremap <S-F6> <C-O>:TernRename<cr>
au FileType javascript noremap <C-]> :TernDef<cr>

:setlocal spell spelllang=en_us
:set nospell

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" visualise trailing white-space
set list listchars=tab:»·,trail:·

" trim trailing white-space
autocmd BufWritePre * :%s/\s\+$//e

" open all folds by default
autocmd BufWinEnter *.* normal zR

" save and restore text folding across vim restarts
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
