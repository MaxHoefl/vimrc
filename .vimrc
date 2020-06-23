syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
"set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


"Vim Plugins"
call plug#begin('~/.vim/plugged')
"youcompleteme: autocompleting across many languages"
Plug 'ycm-core/YouCompleteMe'
"gruvbox: For colorscheme"
Plug 'morhetz/gruvbox'
"ripgrep: Very fast grep"
Plug 'jremmen/vim-ripgrep'
"fugitive: For git support"
Plug 'tpope/vim-fugitive'
"typescript: Nice coloring for typescript files"
Plug 'leafgarland/typescript-vim'
"man: Vim manual page"
Plug 'vim-utils/vim-man'
"ctrlp: Nice file finding"
Plug 'ctrlpvim/ctrlp.vim'
"undotree: for undo history"
Plug 'mbbill/undotree'
" nerdtree: file browsing
Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = ","

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

set backspace=eol,start

" youcompleteme config
"let g:ycm_python_binary_path='python3'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_log_level = 'debug'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>

" split navigation: e.g. press Ctrl+j to go to the window beneath this one
" to create splits use :sp <filename
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable code folding
set foldmethod=indent
set foldlevel=99
" Enable code folding using just spacebar
nnoremap <space> za 

" Save and run python file
nnoremap <F9> :w<cr>:!clear; python %<cr>

" Move lines easily with Shift + Up/Down arrow
nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>

" Nerdtree F2
map <F2> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
