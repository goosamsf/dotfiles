
"   __ _  ___   ___  ___  __ _ _ __ ___  ___| |_ 
"  / _` |/ _ \ / _ \/ __|/ _` | '_ ` _ \/ __|  _|
" | (_| | (_) | (_) \__ \ (_| | | | | | \__ \ |  
"  \__, |\___/ \___/|___/\__,_|_| |_| |_|___/_|  
"   __/ |                                        
" _|___/  _______ __  __ _____   _____           
" \ \    / /_   _|  \/  |  __ \ / ____|          
"  \ \  / /  | | | \  / | |__) | |               
"   \ \/ /   | | | |\/| |  _  /| |               
"    \  /   _| |_| |  | | | \ \| |____           
"    \/   |_____|_|  |_|_|  \_\\_____|          

call plug#begin()

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


"ftplug setting
filetype on
filetype plugin on
filetype indent on


let g:airline_theme='minimalist'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
"let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
"let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Basic Setting
set incsearch
set ruler
set hidden
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set wildmenu
set wildignorecase
set wildignore=\*.git/
set completeopt=menuone,longest
set autoindent
set smartindent
set softtabstop=2
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
"set noexpandtab
set expandtab        " expand tabs to spaces
"set textwidth=75
syntax on
set number relativenumber
set showmatch
set splitbelow splitright

set rtp+=/opt/homebrew/opt/fzf
"hi MatchParen cterm=none ctermbg=white ctermfg=red
hi MatchParen cterm=none 
filetype plugin indent on

"Set up Leader Key
nnoremap <Space> <Nop> 
let mapleader = " " "Set space bar is leader key. 

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr> 
nnoremap <leader>x :x<cr>
nnoremap <leader><Tab> :bn<cr>
nnoremap <leader>` :bp<cr>
"nnoremap <leader>l :set list 
"nnoremap <leader>e :e .<cr>
"nnoremap <leader>f :Lines<cr>
"nnoremap <leader>e :Files<cr>
nnoremap <leader>t :r !cat /Users/jun/bin/templates/
nnoremap <leader>l :Goyo<cr>
"Shorve file tcutting spve file live file tve file  navigation, saving a keypre:

"tnoremap <C-h> <C-\><C-n><C-w>h
"tnoremap <C-l> <C-\><C-n><C-w>l
"tnoremap <C-j> <C-\><C-n><C-w>j
"tnoremap <C-k> <C-\><C-n><C-w>k

"Ctrl-d + zz combination
"Ctrl-u + zz combination
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz

"Copy and paste from other program to vim
vnoremap <C-c> "+y

"abbreviation
function! NetrwMapping()
	nmap <buffer> H u
	nmap <buffer> h -^
	nmap <buffer> l <CR>
endfunction

set updatetime=100
command! -bang ProjectFiles call fzf#vim#files('~/spring2023', <bang>0)

"ESC in insert and visual mode
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"Ctrl + l is End of line
nnoremap <C-l> $
nnoremap d<C-l> d$

"Ctrl + a is Beginning of line
nnoremap <C-a> 0
nnoremap d<C-a> d0


inoremap <C-n> <C-x><C-n>
inoremap <expr> j pumvisible() ? "<C-n>" :"j"
inoremap <expr> k pumvisible() ? "<C-p>" :"k"
inoremap <expr> l pumvisible() ? "<C-y>" :"l"
inoremap <expr> h pumvisible() ? "<C-e>" :"h"
