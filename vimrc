call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
let mapleader = ","
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim

" open up my ~/.vimrc file in a vertically split window so I can add new
" things to it on the fly
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" reload vimrc while vim is running
"nnoremap <leader>vr :source $MYVIMRC<cr>

",v brings up my .vimrc
"",V reloads it -- making all changes active (have to save first)
nnoremap <leader>v :tabnew $MYVIMRC<cr>
nnoremap <leader>V :source $MYVIMRC<cr>

" LustyJuggler buffer switcher
nnoremap <silent> <Leader>j :LustyJuggler<CR>
nnoremap <leader>a :Ack

" move by display lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <S-Down> vgj
nnoremap <S-Up> vgk
vnoremap <S-Down> gj
vnoremap <S-Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" CTRL-A is Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" smart home key for indented lines: go to first non-blank character (not start of line) of display line (not
" numbered line)
nnoremap <home> g^
nnoremap <end> g$
vnoremap <home> g^
vnoremap <end> g$
"alternatively: vg^ to automatically enter visual mode first
nnoremap <S-home> vg^ 
nnoremap <S-end> vg$
inoremap <home> <C-O>g^
inoremap <end> <C-O>g$
inoremap <S-home> <C-O>vg^ 
inoremap <S-end> <C-O>vg$
vnoremap <S-home> g^ 
vnoremap <S-end> g$

filetype off
syntax on
filetype plugin indent on

"filetype off
"call pathogen#runtime_append_all_bundles()
"filetype plugin indent on

"if &t_Co > 2 || has("gui_running")
set hlsearch
"endif
  
let g:rubycomplete_rails = 1
" set modelines=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set enc=utf-8
set fileencodings=utf-8,latin2,latin2
set ignorecase

" set fileencodings=ucs-bom,utf-8,latin2,latin1
"set scrolloff=3
"set autoindent
"set showmode
"set showcmd
"set hidden
"set wildmenu
"set wildmode=list:longest
"set visualbell
"set cursorline
"set ttyfast
"set ruler
set backspace=indent,eol,start
"set laststatus=2
"set number
"set relativenumber
set number
autocmd FileType nerdtree setlocal nonumber
autocmd FileType taglist setlocal nonumber

nnoremap <leader><space> :noh<cr>
" set undofile
set wrap
" set textwidth=79
" set formatoptions=qrn1
" set colorcolumn=85
" set list
" set listchars=tab:?\ ,eol:?

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t><z> :tabnew<cr>
map <C-t><c> :tabclose<cr>

"set mouse=v
set mouse=a
set t_Co=256 "enable 256 colors within vim - grey background, proper syntax highlighting etc.
colorscheme molokai_losh
"set noanti "turns off font smoothing (anti-aliasing) - doesn't work in gVim
"on Ubuntu
"set guifont=Consolas:h9:cANSI
"set guioptions-=T  "remove toolbar
set smartindent
set linebreak
" autocmd VimEnter * NERDTree 
" autocmd TabEnter * NERDTreeMirror

" NERDTree configuration
" Increase window size to 35 columns
let NERDTreeWinSize=30
let NERDTreeWinPos='right'
" let NERDTreeShowHidden = 1
" map <F7> to toggle NERDTree window
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" put all temporary and swap files into a single folder; '//' makes sure swap
" filenames start with the files' full pathname, this prevents duplicate swap
" files for files with the same name in different locations
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

" set breakindent "requires vim patch =(


"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
