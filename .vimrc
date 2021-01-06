syntax on
set tabstop=4
set shiftwidth=4
set smarttab
" Linebreak on 1000 characters
set lbr
set tw=1000

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set cindent

set number " Line numbers
set autowrite
" Add the title of the file to the top of the window
set title
" Remove error bells
set noerrorbells
set vb t_vb=
" Set the line length so allow reformatting with gq command
au BufRead,BufNewFile *.md setlocal textwidth=75
" Syncronize the clipboard with the default one
set clipboard=unnamed
" Spell Check
set spelllang=en
" Menu for selecting commands by tapping tab after :
set wildmenu
" A buffer is hidden when abandoned
set hid
" Ignore case when searching
set ignorecase
" but be smart about cases when searching
set smartcase
" Highlight search results
set hlsearch
" Fixes behaviour of the backspace so it properly deletes stuff
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" Makes things load faster
set updatetime=100

" Reduce size of preview-window
set previewheight=3

" The escape character for our commands
let mapleader = ","

call plug#begin()

" To support arduino syntax
Plug 'sudar/vim-arduino-syntax'

" To support Go plugin stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" For the color scheme
Plug 'fatih/molokai'

" To enable :GoDecls (go declarations list of functions)
Plug 'ctrlpvim/ctrlp.vim'

" For syntax in javascript and jsx
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Typescript Plugin
Plug 'leafgarland/typescript-vim'
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

" Javascript doc (use :JsDoc or ,j)
Plug 'heavenshell/vim-jsdoc'

" Javascript linting
"" Plug 'wookiehangover/jshint.vim'
Plug 'w0rp/ale'

let g:ale_c_build_dir = "./output"
let g:ale_c_parse_makefile = 1
let g:ale_cpp_gcc_options = "-std=c++11 -isystem /usr/include/c++/v1 -I/usr/include/c++/v1 -I/opt/ros/kinetic/include -I/usr/local/include -I/usr/include -I/usr/include/x86_64-linux-gnu -I./include/vicon -I./include/websocketpp -I./include/asio/asio/include $(pkg-config opencv4 --cflags --libs)"
let g:ale_cpp_clang_options = "-std=c++11 -isystem /usr/include/c++/v1 -I/usr/include/c++/v1 -I/opt/ros/kinetic/include -I/usr/local/include -I/usr/include -I/usr/include/x86_64-linux-gnu -I./include/vicon -I./include/websocketpp -I./include/asio/asio/include $(pkg-config opencv4 --cflags --libs)"

" SQL formatting
Plug 'Chiel92/vim-autoformat'
let g:formatdef_sql = '"sqlformat --reindent --reindent_aligned --keywords upper - identifiers lower -"'
let g:formatters_sql = ['sql']
nnoremap <leader>f :Autoformat<CR>

" Tree navigator for vim
Plug 'preservim/nerdtree'
"" map <C-t> :NERDTreeToggle<CR>
nnoremap <leader>T :NERDTreeToggle<CR>

" AutoComplete
Plug 'vim-scripts/dbext.vim'
Plug 'lifepillar/vim-mucomplete'
set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#delayed_completion = 1

" For linting javascript automatically on save
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 0

call plug#end()

" For javascript
nnoremap <leader>j :JsDoc<CR>

" For sql linting
"" autocmd BufWritePost *.sql ALEFix
"" let b:ale_fixers = ['pgformatter']
" Lint on save
"" let g:ale_fix_on_save = 1

" For the color scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" Always use golangci-lint to format go files
let g:go_metalinter_command = 'golangci-lint'
let g:go_list_type = 'quickfix'
" Always use the linter when save
let g:go_metalinter_autosave = 1
" Always show function info at bottom of screen
let g:go_auto_type_info = 1
" Always highlight items with same identifiers
"" let g:go_auto_sameids = 1

" Used to go to the next item in GoTest or GoLint or GoFmt
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Switches between testing and declaration docs
"" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" Used to test quickly
autocmd FileType go nmap <leader>t <Plug>(go-test)
" Used to build quickly
autocmd FileType go nmap <leader>b <Plug>(go-build)
" Used to run quickly (this is now for reformatting
autocmd FileType go nmap <leader>r <Plug>(go-run)
" Used to show what code has been covered with testing
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" Used to show the return type and parameter types for go
"" autocmd FileType go nmap <Leader>i <Plug>(go-info)

