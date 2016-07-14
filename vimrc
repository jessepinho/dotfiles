execute pathogen#infect()

autocmd BufNewFile,BufRead *.md set filetype=markdown " Highlight Markdown properly (http://stackoverflow.com/a/23279293/974981)
colorscheme solarized
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

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Use skinny cursor in Insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Use block cursor for everything else

set background=light
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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeWinSize=29 " A width of 29 allows three columns to stack up in vim perfectly at a width of 81, with the last character highlighted to show that it's the boundary
let NERDTreeIgnore=['\.swp$', '\.swo$'] " Ignore vim swapfiles
let NERDTreeShowHidden=1 " Show hidden files
let NERDTreeShowLineNumbers=1

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
      \ [ 'a', 'warning' ]
      \ ]

" Switch between test and production code "
"""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Running tests "
"""""""""""""""""
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    if match(a:filename, '\.feature$') != -1
        exec ":!bundle exec rspec --color -fd " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>s :call RunTestFile()<cr>
map <leader>S :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
