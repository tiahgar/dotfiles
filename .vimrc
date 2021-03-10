set nocompatible                " no vi

" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" theme
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'

" undo history
Plug 'mbbill/undotree'

" search
Plug 'kien/ctrlp.vim'

" whitespace
Plug 'bronson/vim-trailing-whitespace'

" marks
Plug 'kshenoy/vim-signature'

" file manager
Plug 'tpope/vim-vinegar'

" startpage
Plug 'mhinz/vim-startify'

" autocomplete
Plug 'ervandew/supertab'

call plug#end()

" general settings
" set clipboard^=unnamed          " yank to * reg/clipboard
set expandtab                   " expand tabs to spaces
set tabstop=4                   " tab width of 4
set shiftwidth=4                " tab width of 4
" TODO adjust this behaviour for make files and sh scripts
set title                       " file title in status bar
set hidden                      " can switch from modified buffers
set autoread                    " autoread changed files outside of vim
set hlsearch                    " highlight search
set incsearch                   " increased search
set ignorecase                  " case insensitive search
set smartcase                   " unless there is case in our search
set linebreak                   " linebreak on words not letters
set number                      " show current line numbers
set relativenumber              " relative numbers
set mouse=a                     " mouse support
set pastetoggle=<F10>           " toggle paste mode
set t_Co=256                    " 256 colors :)
set wildmenu                    " command completion in extra bar
set showcmd                     " show cmd bottom right
set scrolloff=5                 " keeps cursor lines above or below when scrolling
set sidescrolloff=5             " keeps 5 chars of the sides
set directory^=$HOME/.vim/tmp   " swap file location
set nofoldenable                " disable folding
set autochdir                   " autochange dir to file location NOTE: might break plugins
set wildmode=longest,list,full  " command autocompletion...
set laststatus=2                " show status line
set spell                       " spell checking

syntax on                       " syntax highlighting
set background=dark             " dark background
colorscheme monokai
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "dark"
let mapleader="\<space>"

" Default .tex flavor to LaTeX
let g:tex_flavor='latex'

filetype plugin indent on

" execute pathogen#infect()
" call pathogen#helptags()

" let g:voom_tree_width = 50
" let g:voom_tree_placement = "right"
" noremap <F4> :VoomToggle<cr>

nnoremap <F5> :UndotreeToggle<CR>

" buffer navigation
map <C-Right> :bn<cr>
map <C-Left> :bp<cr>

" paste codeblock
nnoremap <F12> o\begin{coden}<cr>\end{coden}<esc><up> :r!xsel -b <cr>
inoremap <F12> \begin{coden}<cr>\end{coden}<esc><<<up> :r!xsel -b <cr>

" snip code blocks
vnoremap <leader>. c[...]<ESC>

" paste black hole
vnoremap <leader>p "_dP

" Copy to 'clipboard registry'
vmap <C-c> "+y

" Select all text
nmap <C-a> ggVG

" surround macros
autocmd FileType tex let b:surround_{char2nr("!")} = "!!\r!!"
autocmd FileType tex let b:surround_{char2nr("`")} = "`\r'"
autocmd FileType tex let b:surround_{char2nr("@")} = "@@\r@@"
autocmd FileType tex let b:surround_{char2nr("a")} = "\\acs{\r}"
autocmd FileType tex let b:surround_{char2nr("c")} = "\\cmd{\r}"
autocmd FileType tex let b:surround_{char2nr("e")} = "\\begin{\1environment: \1}\r\\end{\1\1}"
autocmd FileType tex let b:surround_{char2nr("u")} = "\\url{\r}"
autocmd FileType tex let b:surround_{char2nr("v")} = "\\vref{\r}"

" Silent sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" line length
set colorcolumn=80
