call pathogen#infect() 

set tabstop=4
set showmatch
set incsearch
set number
set autoindent
set shiftwidth=4
set nofoldenable    " disable folding
set modeline
set ls=2

syntax on

set shell=bash

let g:gitgutter_enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_theme='luna'

map ,t :w\|:!mocha %
map ,p :w\|:!python %
map ,y :w\|:!node % 
map ,c :w\|:!echo % \| pbcopy \<cr>

" go to last cursor postion if there was one
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

au BufNewFile,BufRead *.less set filetype=css

au BufEnter *.js vmap ,c <esc>:'<, '>:w !highlight --syntax=js --style=zenburn --line-numbers -O rtf \| pbcopy<CR>
