execute pathogen#infect()

autocmd BufNewFile,BufRead *.md set filetype=markdown " Highlight Markdown properly (http://stackoverflow.com/a/23279293/974981)
autocmd BufWritePre * :%s/\s\+$//e " Strip trailing whitespace on save
filetype plugin indent on " Enable filetype-specific indenting
syntax on

" Use Ctrl-B to toggle the background between light/dark.
if !exists("*ToggleBackground")
  function ToggleBackground()
    if &background == "light"
      set background=dark
    else
      set background=light
    endif
  endfunction
endif
:map <C-B> :call ToggleBackground()<CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Use skinny cursor in Insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Use block cursor for everything else

set background=light
set backspace=indent,eol,start " Backspace fix; see http://stackoverflow.com/a/5019353/974981
set colorcolumn=81 " Highlight the 81st character of each line (to show where to wrap)
set dir=/var/tmp " Put swapfiles in /var/tmp
set exrc " Enable per-directory .vimrc files
set laststatus=2 " Always show the status line
set expandtab
set guifont=Menlo\ for\ Powerline:h9 " For Airline
set guioptions-=r " Disable the right-hand scrollbar
set ignorecase " Make search case-insensitive by default
set tabstop=2
set shiftwidth=2
set autoindent
set mouse=a
set number
set secure " Disable unsafe commands in per-directory .vimrc files
set t_Co=256
set splitright " Splits open to the right of the current buffer instead of to the left
set splitbelow " Splits open below the current buffer instead of above

" Syntastic "
"""""""""""""
let g:syntastic_typescript_checkers = [] " Typescript checkers are slooowwwww

" ctrlp "
"""""""""
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass\-cache)|node_modules|bower_components|tmp|_site|dist$',
  \ 'file': '\v.*\.(swp|swo)$',
  \ 'link': '',
  \ }

" NERDTree "
""""""""""""
" Load NERDTree by default (unless it's a Git commit; see http://superuser.com/questions/554396/vim-prevent-nerdtree-opening-when-invoked-by-git)
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif

" Close NERDTree if it's the last buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeWinSize=29 " A width of 29 allows three columns to stack up in vim perfectly at a width of 81, with the last character highlighted to show that it's the boundary
let NERDTreeIgnore=['\.swp$', '\.swo$'] " Ignore vim swapfiles
let NERDTreeShowHidden=1 " Show hidden files
let NERDTreeShowLineNumbers=1

set guioptions-=L " Disable the left-hand scrollbar for NERDTree, per http://stackoverflow.com/a/4007704/974981

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

" vim-airline  "
""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline#extensions#default#section_truncate_width = {
      \ 'a': 60,
      \ 'b': 88,
      \ }
let g:airline#extensions#default#layout = [
      \ [ 'c' ],
      \ [ 'a', 'z', 'warning' ]
      \ ]

" UltiSnips "
"""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" neocomplete "
"""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup=0
" Use neocomplete.
let g:neocomplete#enable_at_startup=1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" tsuquyomi "
"""""""""""""
let g:tsuquyomi_single_quote_import=1

" vim-colors-solarized "
""""""""""""""""""""""""
" Fix color scheme issues. See
" https://github.com/altercation/vim-colors-solarized/tree/528a59f26d12278698bb946f8fb82a63711eec21#important-note-for-terminal-users
let g:solarized_termcolors=256
colorscheme solarized
