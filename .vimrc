call pathogen#infect() 

set tabstop=2
set shiftwidth=2
set expandtab
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

colorscheme aloe
set background=dark

" gitgutter
let g:gitgutter_enabled = 1

" markdown
let g:vim_markdown_folding_disabled=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_theme='sol'

highlight ColorColumn ctermbg=255

map ,t :w\|:!mocha %
map ,p :w\|:!python %
map ,y :w\|:!node % 
map ,c :w\|:!echo % \| pbcopy \<cr>

map ,b :w\|:!gulp bundle
map ,bw :w\|:!gulp bundle-web
map ,ba :w\|:!gulp bundle-web

map ,gb :Gblame<cr>
map ,gg :Ggrep<cr>
map ,gl :Glog<cr>

" go to last cursor postion if there was one
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.json set filetype=js
au BufNewFile,BufRead *.md set filetype=markdown

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


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

augroup PatchDiffHighlight
  autocmd!
  autocmd BufEnter *.patch,*.rej,*.diff syntax enable
augroup END
