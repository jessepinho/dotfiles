execute pathogen#infect()

autocmd BufNewFile,BufRead *.md set filetype=markdown " Highlight Markdown properly (http://stackoverflow.com/a/23279293/974981)
colorscheme solarized
autocmd BufWritePre * :%s/\s\+$//e " Strip trailing whitespace on save
filetype indent on " Enable filetype-specific indenting
syntax on

set background=dark
set backspace=indent,eol,start " Backspace fix; see http://stackoverflow.com/a/5019353/974981
set colorcolumn=81 " Highlight the 81st character of each line (to show where to wrap)
set exrc " Enable per-directory .vimrc files
set laststatus=2 " Always show the status line
set expandtab
set guifont=Menlo\ for\ Powerline:h9 " For Airline
set guioptions-=L " Disable the left-hand scrollbar for NERDTree, per http://stackoverflow.com/a/4007704/974981
set guioptions-=r " Disable the right-hand scrollbar
set ignorecase " Make search case-insensitive by default
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set mouse=a
set number
set secure " Disable unsafe commands in per-directory .vimrc files
set t_Co=256

" ctrlp "
"""""""""
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass\-cache)|node_modules|bower_components|tmp|_site$',
  \ 'file': '',
  \ 'link': '',
  \ }

" NERDTree "
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

" vim-airline  "
""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_section_b = ''
