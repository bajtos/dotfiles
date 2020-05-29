scriptencoding utf-8
set encoding=utf-8

if has('win32') || has ('win64')
  set viewdir=$HOME/vimfiles/view
endif

filetype off

" workaround for vim-javascript
:set regexpengine=1
:syntax enable

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

command E Ex " disambiguation - :E can be :Ex or :Errors

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

au FileType gitcommit set tw=72 ts=4 sts=2

:nnoremap <leader>m :silent !open -a 'Marked 2.app' '%:p'<cr>

au FileType javascript :noremap <S-F6> :TernRename<cr>
au FileType javascript :inoremap <S-F6> <C-O>:TernRename<cr>
au FileType javascript noremap <C-]> :TernDef<cr>
au FileType gitconfig set noet

" au FileType markdown :set tw=0

:noremap <F2> :make<cr>
:inoremap <F2> <C-O>:make<cr>

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

" Leader shortcuts
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" Type <Space>o to open a new file:
nnoremap <Leader>o :CtrlP<CR>

" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Hit v to select one character, v again to expand to word, etc.
vmap v <Plug>(expand_region_expand)

" Hit <C-v> to go back to previous selection if I went too far
vmap <C-v> <Plug>(expand_region_shrink)

" Configure CtrlP to use git or silver searcher for autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Disable modeline to prevent security vulnerabilities
" See https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline
