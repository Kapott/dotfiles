set nocp

"--- Vundle bootstrap & plugin setup
if !filereadable($HOME . '/.vim/bundle/Vundle.vim/.git/config') && confirm("Clone Vundle?","Y\nn") == 1
  exec '!git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim/'
endif

filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim|
set rtp+=~/.vim/bundle/ctrlp.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
call vundle#end()

"--- Syntax highlighting & color scheme
filetype plugin indent on
syntax on
syntax enable
colorscheme monokai
set background=dark

"--- Text wrapping & line length
set colorcolumn=101
set textwidth=100
set wrap

"--- Code indentation & formatting
set ai
set number
set relativenumber

"--- Tab and space settings
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

"--- Error handling
set vb
set noeb
set laststatus=2

"--- Split handling & navigation
set splitbelow
set splitright

"--- Legibility & usability
set list listchars=tab:»·,trail:·
let mapleader = ","
let g:mapleader = ","
set incsearch
set hlsearch
set so=1

"-- Dont want to shift to enter command mode
nnoremap ; :
nnoremap : ;

"--- Tab creation, usage & navigation
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tx :tabclose<CR>

"--- Split creation, usage & navigation (integrate with tmux!)
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
"nnoremap <C-h> <C-w><C-h>

"--- Nerdtree specific settings
map <C-n> ;NERDTreeToggle<CR>
let g:NERDTreeWinSize=60

"--- Autoclose if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")  && b:NERDTreeType == "primary") | q | endif

"--- Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"--- Remap arrow keys, strange behaviour etc.
" set t_ku=OA
" set t_kd=OB
" set t_kl=OD
" set t_kr=OC

"-- Auto remove trailing whitespaces on file write
autocmd BufWritePre * %s/\s\+$//e
