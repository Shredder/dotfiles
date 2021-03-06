set clipboard=exclude:.*
syntax on " syn
set hlsearch " hls
set nowrapscan "nows
set ignorecase "ic
set smartcase "scs
set scrolloff=10 "so
set cindent " ci
set expandtab "et
set shiftwidth=4
set softtabstop=4 "sts
set nobackup "nobk
set laststatus=2 "ls; always display statusline
set statusline+=%F%=%l/%L " stl
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set showbreak=->
set background=dark
" set clipboard=unnamedplus
set timeoutlen=200
set hidden " hid
set relativenumber " rnu
set number " nu

call plug#begin()

" Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-speeddating'
Plug 'tommcdo/vim-exchange'
Plug 'tComment'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
" Plug 'terryma/vim-multiple-cursors'
Plug 'matchit.zip'
" Plug 'thinca/vim-quickrun'
Plug 'kana/vim-textobj-user'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
" Plug 'terryma/vim-expand-region'
" Plug 'PeterRincker/vim-argumentative'
Plug 'wellle/targets.vim'
Plug 'kien/ctrlp.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'justinmk/vim-ipmotion'
" Plug 'yegappan/mru'
" Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" " Plug 'klen/python-mode'
Plug 'bronson/vim-visual-star-search'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'vim-scripts/diffchar.vim'
Plug 'vim-scripts/occur.vim'

Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'rhysd/vim-textobj-lastinserted'
Plug 'thinca/vim-textobj-between'
" Plug 'Julian/vim-textobj-brace'
Plug 'glts/vim-textobj-comment'
Plug 'glts/vim-textobj-indblock'
" Plug 'rhysd/vim-textobj-continuous-line'
" Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-syntax'
Plug 'saaguero/vim-textobj-pastedtext'
" Plug 'osyo-manga/vim-textobj-multiblock'
" Plug 'sgur/vim-textobj-parameter'
" Plug 'beloglazov/vim-textobj-punctuation'
" Plug 'beloglazov/vim-textobj-quotes'
" Plug 'Julian/vim-textobj-variable-segment'
" Plug 'whatyouhide/vim-textobj-xmlattr'
" Plug 'paulhybryant/vim-textobj-path'
Plug 'saihoooooooo/vim-textobj-space'
" Plug 'bps/vim-textobj-python'
" Plug 'SirVer/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" Plug 'rhysd/vim-operator-filled-with-blank'
Plug 'deris/vim-operator-insert'
" Plug 'amoffat/snake'
Plug 'AndrewRadev/switch.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'jlanzarotta/bufexplorer'

Plug 'xuhdev/SingleCompile'
Plug 'tmux-plugins/vim-tmux'

call plug#end()

" " ultisnips
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" " let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" Plugin 'Valloric/YouCompleteMe'
" "Plugin 'http://www.vim.org/scripts/download_script.php?src_id=17531'
" "Plugin 'kana/vim-text-obj-user'
" "Plugin 'kana/vim-text-obj-user'
" Plugin 'cohama/lexima.vim'
" Plugin 'bronson/vim-visual-star-search'
"

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let mapleader = "\<Space>"
nmap <space> <leader>

nnoremap <silent> coz :set lz! \| set lz?<CR>
nnoremap <silent> cows :set ws! \| set ws?<CR>
nnoremap <silent> coa :set paste! \| set paste?<CR>
nnoremap <silent> cohi :set hidden! \| set hidden?<CR>
nnoremap <silent> coro :set readonly! \| set readonly?<CR>
nnoremap <silent> coo :update<CR>

map <silent> <Leader>d *:%s///<CR>

map <silent> <Leader>u :update<CR>
map <silent> <Leader>x :xa<CR>
map <silent> <Leader>q :qa!<CR>
map <silent> <Leader>. :tabn<CR>
map <silent> <Leader>, :tabp<CR>

map <silent> <Leader>x cox:sleep 200m<CR>cox

nnoremap <silent> gm :exe 'normal '.(virtcol('$')/2).'\|'<CR>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Set wrap in vimdiff
au VimEnter if &diff | execute 'windo set wrap' | endif

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

cnoremap <Up>   <C-P>
cnoremap <Down> <C-N>

" call textobj#user#plugin('number', {
" \   'int': {
" \     'pattern': '\<\d\+\>',
" \     'select': ['an', 'in'],
" \   },
" \   'float': {
" \     'pattern': '\<\d\+\.\d\+\>',
" \     'select': ['af', 'if'],
" \   },
" \ })

" easymotion config
let g:EasyMotion_do_mapping = 0 "Disable default mappings
" Single-character motion
nmap <Leader>s <Plug>(easymotion-s)
" Two-character motion
nmap <Leader>t <Plug>(easymotion-s2)

nmap <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
nmap <Leader>n <Plug>(easymotion-next)
nmap <Leader>N <Plug>(easymotion-prev)

let g:EasyMotion_smartcase = 1

" Line motions
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" if you use vim-textobj-multiblock
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" if you use vim-textobj-anyblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" if you use vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

" Remap 's' to 2-char Sneak
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" Replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>sneak_f

" Replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

map <silent><Leader>b <Plug>(operator-filled-with-blank)
nnoremap <Leader>i <Plug>(operator-insert-i)
nnoremap <Leader>a <Plug>(operator-insert-a)

let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1

" Mark on \ key (as m is taken by EasyClip)
nnoremap <Bslash> m

map <Leader>bb :call VimuxRunCommand("clear; " . bufname("%"))<CR>
map <Leader>bq :call VimuxRunCommand("clear; " . bufname("%"), 0)<CR>

" nnoremap <silent> <unique> <Leader># :let ws=&wrapscan<CR>:set wrapscan<CR>*<C-o>:Moccur<CR>:let &g:wrapscan=ws<CR>

inoremap jk <Esc>
inoremap kj <Esc>
inoremap jl <Esc>l
inoremap lj <Esc>l
inoremap <Esc> <nop>
vnoremap jk <Esc>
vnoremap kj <Esc>
vnoremap jl <Esc>l
vnoremap lj <Esc>l
vnoremap <Esc> <nop>

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let g:netrw_liststyle = 3

" let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   {
    \       '\<and\>': 'or',
    \       '\<or\>': 'and',
    \       '>': '<',
    \       '<': '>',
    \       '>=': '<=',
    \       '<=': '>=',
    \       '&': '|',
    \       '|': '&',
    \   },
    \ ]

let g:variable_style_switch_definitions = [
      \   {
      \     '\<[a-z0-9]\+_\k\+\>': {
      \       '_\(.\)': '\U\1'
      \     },
      \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
      \       '\([A-Z]\)': '_\l\1'
      \     },
      \   }
      \ ]

nnoremap + :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap - :Switch<cr>

let g:session_autosave = 0
let g:session_autoload = 0
let g:session_command_aliases = 1
