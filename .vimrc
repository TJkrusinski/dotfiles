call pathogen#infect() 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set showmatch
set incsearch
set number
set nofoldenable    " disable folding
set modeline
set ls=2
set t_Co=256
set listchars=tab:▸\ ,eol:¬

syntax on

set shell=bash

colorscheme github
set background=light

let g:gitgutter_enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_theme='jellybeans'

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

au BufEnter *.js vmap ,c <esc>:'<, '>:w !highlight --syntax=js --style=seashell --line-numbers -O rtf \| pbcopy<CR>
au BufEnter *.html vmap ,ht <esc>:'<, '>:w !highlight --syntax=html --style=zenburn --line-numbers -O rtf \| pbcopy<CR>
au BufEnter *.css vmap ,c <esc>:'<, '>:w !highlight --syntax=css --style=zenburn --line-numbers -O rtf \| pbcopy<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
 if !exists("*synstack")
  return
 endif
 echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
