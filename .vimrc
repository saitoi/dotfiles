" -----------------------------
" General Settings
" -----------------------------
syntax on
set encoding=utf-8          " Set file encoding to UTF-8
set nocompatible            " Better default settings
filetype plugin on          " Enable filetype detection and plugin
set backspace=indent,eol,start

" -----------------------------
" Clipboard OS Specific
" -----------------------------
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed      " Use clipboard on macOS
else
  set clipboard=unnamedplus  " Use clipboard on Linux
endif

" -----------------------------
" Tab and Indentation Settings
" -----------------------------
set tabstop=4               " Set tab width to 4 spaces
set shiftwidth=4            " Set width for auto-indents to 4 spaces
set expandtab               " Convert tabs to spaces
set softtabstop=4           " Soft tab stops at 4 spaces

" -----------------------------
" UI/UX Enhancements
" -----------------------------
set termguicolors           " Enable 24-bit (true-color) mode
set background=dark         " Set background to dark
colorscheme onedark         " Apply the onedark color scheme
set number                  " Show line numbers
set laststatus=2            " Always display the status line
set noshowmode              " Hide the mode text as it's redundant with lightline

if !has('nvim')             " Mouse support in the terminal
    set ttymouse=xterm2
endif

" Enable 24-bit (true-color) mode in Vim
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" -----------------------------
" Key Mappings
" ----------------------------- 

" Map 'J' and 'K' to move down/up 5 lines in normal/visual mode
nnoremap J 5j
nnoremap K 5k
vnoremap K 5k
vnoremap J 5j

" Map 'U' and 'I' to move down/up 10 lines in normal/visual mode
nnoremap I 10k
nnoremap U 10j
vnoremap U 10k
vnoremap I 10j

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-a> :NERDTree<CR>

" Work with splits
nnoremap <C-t> :below term<CR>
nnoremap <C-g> :rightbelow vertical split<CR>:terminal<CR>
nnoremap <C-f> :Files $PWD<CR>
nnoremap <leader>r :Files ~/<CR>
nnoremap O o
nnoremap o o<Esc>

" Navigating through tabs
nnoremap L :tabn<CR>
nnoremap H :tabp<CR>
nnoremap tg :tabfirst<CR>
nnoremap tG :tablast<CR>
nnoremap ts :tab split<CR>
nnoremap ths :tab split<CR>:wincmd H<CR>

" Options to quit a file
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q!<CR>
tnoremap <C-b> <C-\><C-n>

" -----------------------------
" Plugin Management (vim-plug)
" -----------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:lightline = {
            \ 'colorscheme': 'one',
            \ }

let g:NERDTreeFileLines = 1

" -----------------------------
" Custom key bindings for NERDTree
" -----------------------------
" autocmd VimEnter * NERDTree | wincmd p
autocmd FileType nerdtree call SetupNERDTreeMappings()

function! SetupNERDTreeMappings()
    " Map 'l' to open directories in NERDTree
    nmap <buffer> l o

    " Map 'h' to close directories in NERDTree
    nmap <buffer> h o
endfunction

