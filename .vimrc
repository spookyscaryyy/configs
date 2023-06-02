set nocompatible
" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set cc=80

" File detection
filetype plugin indent on
au BufNewFile,BufRead *.tpp set filetype=cpp

" Disable backup files
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
" Configure bash settings
set wildmenu
set wildmode=list:longest,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable mouse
set mouse=a

" Enabled line numbers
set number
set ruler
set ttyfast

" Backspace settings
set backspace=eol,start,indent
set whichwrap+=b,s,<,>,h,l,[,]

" Search Settings
set incsearch
set ignorecase
set smartcase
set hlsearch

set showmatch
let mapleader=','
" Line Length
set textwidth=79

" Format options
set formatoptions=c,q,r

" Show partial command as you type
set showcmd
set undofile
set undolevels=1000
set undoreload=10000
" Enable Syntax Highlighting
syntax on
fun! ClearExtraSpaces()
    let l:save = winsaveview()
    keeppatterns  %s/\s\+$//e
    call winrestview(l:save)
endfun

" Key Bindings
nnoremap <C-s> :w<CR>
inoremap jj <esc>
nnoremap <leader>w :call ClearExtraSpaces()<CR>
nnoremap <leader>gd :ALEGoToDefinition<CR>
map <leader>fc /\v^[<\|=>]{7}( .*\|$ )<CR>
map <leader>tc :tabnew %<CR>
map <leader>td :tabclose<CR>
map <C-l> :tabnext<CR>
map <C-h> :tabprev<CR>
map <C-k> :+tabmove<CR>
map <C-j> :-tabmove<CR>

" ---------------------------------------------------------------------
" Nerd Tree
" ---------------------------------------------------------------------

" Nerd Tree key bindings "
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ---------------------------------------------------------------------
" Syntax Highlighting and Linting
" ---------------------------------------------------------------------

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
if executable('pylsp')
      autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'pylsp',
          \ 'cmd': {server_info->['pylsp']},
          \ 'allowlist': ['python'],
          \ })
endif
let g:ale_linters = {
    \   'cpp': ['vim-lsp', 'ccls'],
    \   'python': ['vim-lsp', 'flake8', 'jedils', 'pylint', 'pylsp'],
    \   'java': ['vim-lsp']
    \ }
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
"let g:ale_linters_explicit = 1
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }

" List of plugins "
call plug#begin()

Plug 'tpope/vim-fugitive'"
Plug 'vim-airline/vim-airline'"
Plug 'vim-airline/vim-airline-themes'"
Plug 'morhetz/gruvbox'

Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rhysd/vim-lsp-ale'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 

call plug#end()

" Color Scheme "
colo gruvbox
set bg=dark
set termguicolors
hi Normal guibg=NONE ctermbg=NONE


set omnifunc=ale#completion#OmniFunc

" ---------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------
"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
" Enable icons "
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Tagline "
"let g:airline_extentsions = ['tabline', 'branch', 'ale']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#show_tab_nr = 0

" Set icons "
let g:airline_left_sep = "\uE0BC"
let g:airline_left_alt_sep = "\uE0BD"
let g:airline_right_sep = "\uE0BE"
let g:airline_right_alt_sep = "\uEOBF"
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
