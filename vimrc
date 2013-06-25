call pathogen#infect()

syntax on

set ts=2
set sw=2
set et

set textwidth=79
set colorcolumn=+1
:hi ColorColumn guibg=#2d2d2d ctermbg=246

set tags=./tags,tags
set laststatus=2
set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l\ (%P\ of\ %L)
