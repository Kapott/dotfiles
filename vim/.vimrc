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
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/todo-txt.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'isRuslan/vim-es6'
call vundle#end()

"--- Syntax highlighting & color scheme
filetype plugin indent on
syntax on
"syntax enable
colorscheme monokai
set background=dark
set backspace=indent,eol,start

"--- Text wrapping & line length
set colorcolumn=101
set textwidth=100
set wrap

"--- Code indentation & formatting
set ai
set number
set relativenumber

"--- Tab and space default settings
set tabstop=4
set noexpandtab
set softtabstop=4
set shiftwidth=4

"--- Error handling
set vb
set noeb
set laststatus=2

"--- Split handling & navigation
set splitbelow
set splitright

"--- Legibility & usability
set list listchars=tab:»·,trail:·,eol:¬
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

"--- Toggle invisible chars (t)oggle (i)nvisible
nnoremap <Leader>ti :set list!<CR>

"--- Spaces, and tabs and files - oh my!
" ts = width of tab
" sw = amount of columns to indent with >> or <<
" sts = amount of whitespace inserted when tab is pressed to reach tabstop
" expandtab/noexpandtab = 'expand' tab into spaces, or don't
"
if has("autocmd")
	" enable filetype detection
	filetype on

	" These filetypes are fussy about tabs vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Stip trailig whitespace without moving cursor
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" <F5> Strips all trailing whitespaces
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Upon closing these files, auto-remove whitespaces
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Watch my .vimrc (works with all kinds of gui's!) and reload when a change occurs
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"--- Git settings (fugitive)
nnoremap <Leader>gc :Gcommit %<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gst :Gstatus<CR>

"--- Split creation, usage & navigation (integrate with tmux!)
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
"nnoremap <C-h> <C-w><C-h>

"--- Nerdtree specific settings
map <C-n> ;NERDTreeToggle<CR>
let g:NERDTreeWinSize=40

"--- Autoclose if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"--- Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"--- Remap arrow keys, strange behaviour etc.
" set t_ku=OA
" set t_kd=OB
" set t_kl=OD
" set t_kr=OC

set encoding=utf-8
"--- Airline status bar symbols maping
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
