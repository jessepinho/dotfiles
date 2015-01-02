execute pathogen#infect()

" Highlight Markdown properly (http://stackoverflow.com/a/23279293/974981)
autocmd BufNewFile,BufRead *.md set filetype=markdown

set exrc " Enable per-directory .vimrc files
set secure " Disable unsafe commands in per-directory .vimrc files
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set mouse=a
set number

" Highlight the 81st character of each line (to show where to wrap)
set colorcolumn=81

" Always show the status line
set laststatus=2

" For Airline
set guifont=Menlo\ for\ Powerline:h9

" Disable the left-hand scrollbar for NERDTree, per
" http://stackoverflow.com/a/4007704/974981
set guioptions-=L

" Disable the right-hand scrollbar
set guioptions-=r

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

syntax on
set t_Co=256
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" AIRLINE "
""""""""""

let g:airline_section_b = ''
"let g:airline#extensions#default#section_truncate_width = {
"  \ 'b': 120,
"  \ 'x': 60,
"  \ 'y': 150,
"  \ 'z': 45,
"  \ }

" Backspace fix; see http://stackoverflow.com/a/5019353/974981
set backspace=indent,eol,start

" NERDTREE "
""""""""""""

" Load NERDTree by default
autocmd vimenter * NERDTree

" Close NERDTree if it's the last buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files
let NERDTreeShowHidden=1

" A width of 29 allows three columns to stack up in vim perfectly at a width of
" 81, with the last character highlighted to show that it's the boundary
let g:NERDTreeWinSize=29

" CtrlP "
"""""""""
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass\-cache)|node_modules|bower_components|tmp|_site$',
  \ 'file': '',
  \ 'link': '',
  \ }
" Clear cache every time
" silent! nmap <unique> <silent> <C-P> :ClearCtrlPCache<cr>\|:CtrlP<cr>
