" Portable vim baseline — no plugin manager required

set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on

" Display
set number
set relativenumber
set showcmd
set hidden
set cursorline
set laststatus=2
set ruler

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc> :nohlsearch<CR>

" Files
set wildmenu
set wildmode=longest:full,full
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//
set backspace=indent,eol,start

" Window layout
set scrolloff=3
set sidescrolloff=5
set splitbelow
set splitright

" Leader and shortcuts
let mapleader = ","
nnoremap <Leader>w :w<CR>

colorscheme desert
# cleanup whitespace
# small git alias tweak
# small git alias tweak
# tweak alias
# touch backup script
# fix typo in comment
# small git alias tweak
# tweak alias
# readme wording
# tweak alias
# minor shell cleanup
# small git alias tweak
# readme wording
# readme wording
# small git alias tweak
# adjust vim setting
# small git alias tweak
# cleanup whitespace
# touch backup script
# minor shell cleanup
# minor shell cleanup
