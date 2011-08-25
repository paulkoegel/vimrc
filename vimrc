" this is just a reminder (don't uncomment the following line, the keyboard shortcut is served up directly by the plugin, cf. http://www.vim.org/scripts/script.php?script_id=3361)
" indentation guides: <leader>ig

"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

source $VIMRUNTIME/mswin.vim
behave mswin

" RABL support
autocmd BufRead,BufNewFile *.rabl setf ruby
autocmd BufRead,BufNewFile *.pde setf javascript

call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
let mapleader = ","
set nocompatible


" N E R D T R E E     A U T O L O A D
" ===================================
"autocmd VimEnter * NERDTree 
"autocmd BufEnter * NERDTreeMirror
"autocmd TabEnter * NERDTreeMirror

map <leader>u :%!json_xs -f json -t json-pretty<CR>

" Format of GUI tab label
set guitablabel=%{GuiTabLabel()}

function! GuiTabLabel()
  " add the tab number
  " let label = tabpagenr().']'
  let label = ""

  " modified since the last save?
  let buflist = tabpagebuflist(v:lnum)
  for bufnr in buflist
    if getbufvar(bufnr, '&modified')
      let label .= '*'
      break
    endif
  endfor
 
  " count number of open windows in the tab
  "let wincount = tabpagewinnr(v:lnum, '$')
  "if wincount > 1
    "let label .= ', '.wincount
  "endif
  "let label .= '] '

  " add the file name without path information
  let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
  " BUGFIX for tab names 'NERD_tree_1', when NERDTree is active
  " for NERDTrees on the right
  if (n == 'NERD_tree_1' && tabpagewinnr(v:lnum) > 1)
    if ((tabpagewinnr(v:lnum) - 2) >= 0)
      let n = bufname(buflist[tabpagewinnr(v:lnum) - 2])
    endif
  endif
  " for NERDTrees on the left
  if (n == 'NERD_tree_1' && tabpagewinnr(v:lnum) > 1)
    if (tabpagewinnr(v:lnum) <= tabpagewinnr(v:lnum, '$'))
      let n = bufname(buflist[tabpagewinnr(v:lnum)])
    endif
  endif
  let label .= fnamemodify(n, ':t')

  return label
endfunction

" Always show tab bar - fixes maximize window & hide status bar bug in Ubuntu
set showtabline=2

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
nnoremap <silent> <leader>m :LustyJuggler<CR>
nnoremap <leader>a :Rgrep 

nnoremap <C-^> :q<CR>

" shortcut for hash rocket
imap <C-q> <Space>=><Space>
" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

" automatically cd into directory of file you've opened in current buffer
"autocmd BufEnter * lcd %:p:h
" cd NERDTree into folder of currently opened file
map <leader>r :NERDTreeFind<cr>


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
set gfn=Monospace\ 9
"set guifont=Monospace:h12:cANSI
set guioptions-=T  "remove toolbar
set smartindent
set linebreak

nnoremap <C-t> :tabnew<CR>
inoremap <C-t> :tabnew<CR>
vnoremap <C-t> :tabnew<CR>

" SPLITS
" ======
" window
nmap <leader>H  :topleft  vnew<CR>
nmap <leader>L  :botright vnew<CR>
nmap <leader>K  :topleft  new<CR>
nmap <leader>J  :botright new<CR>

" buffer
nmap <leader>h  :leftabove  vnew<CR>
nmap <leader>l  :rightbelow vnew<CR>
nmap <leader>k  :leftabove  new<CR>
nmap <leader>j  :rightbelow new<CR>



"shortcut for next tab
map <C-e> gt 
" previous tab
map <C-e> gT

" NERDTree configuration
" Increase window size to 35 columns
let NERDTreeWinSize=30
let NERDTreeWinPos='right'
" let NERDTreeShowHidden = 1
" map <F7> to toggle NERDTree window
inoremap <silent> <F7> <C-O>:NERDTreeToggle<CR> 
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" put all temporary and swap files into a single folder; '//' makes sure swap
" filenames start with the files' full pathname, this prevents duplicate swap
" files for files with the same name in different locations
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

" REARRANGE TABS
map <silent><C-S-Right> :execute TabRight()<CR>
map <silent><C-S-Left>  :execute TabLeft()<CR>

function! TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function! TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

" vim-color-css
" g:cssColorVimDoNotMessMyUpdatetime is used when updatetime value set by plugin (100ms) is interfering with your confiduration.
let g:cssColorVimDoNotMessMyUpdatetime = 1


" SYNTASTIC
" =========
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"always show status line
"set laststatus=2
"set statusline=%<%y\ b%n\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"for Syntastic
"SyntasticEnable sass
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1


" Saving Folds
" ============
" cf. http://ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds/
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END


" CUSTOM
" ======
nmap <C-P> :cd ~/open-heart-surgery/thorax<CR>
nmap <C-O> :cd ~/lysbon/repo<CR>
"command alias for save saving
:ca W w 
"nmap <leader>fs :set foldmethod=syntax<CR>
"nmap <leader>fm :set foldmethod=manual<CR>

" SEARCH
" ------
set hlsearch " highlight search terms
set incsearch " start hihglighting (partial) matches as soon as you start typing letters after '/'

" INDENTATION
" ===========
" set breakindent "requires vim patch =(
" set bri " requires vim path, instructions: http://jasonanderson.us/articles/perfecting-vim

"ALIASES
"=======

" disable F1
" ----------
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" quickly switch to normal mode
inoremap jj <ESC>

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
