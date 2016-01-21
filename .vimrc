""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 需要重新编译vim
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pip install flake8 jedi
" git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
"github
Bundle 'VundleVim/Vundle.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'honza/vim-snippets'
Bundle 'hdima/python-syntax'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'rking/ag.vim'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ervandew/supertab'

Bundle 'AutoClose--Alves'
Bundle 'repeat.vim'
Bundle 'ShowMarks'
Bundle 'surround.vim'
"Bundle 'Lokaltog/vim-powerline'
call vundle#end()
filetype plugin on
""""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""""
set clipboard^=unnamed,unnamedplus
set backspace=indent,eol,start
set nofoldenable
set foldlevel=11
set foldmethod=syntax
set foldnestmax=10
set nobackup
"set completeopt=longest,menu,preview
set completeopt=longest,menu
set display=lastline
set nocompatible
set autochdir
set tags=tags;
set sessionoptions-=curdir
set autoread
set history=1000
set confirm
set iskeyword+=_,$,@,%,#,-
set viminfo='10,\"100,:20,%,n~/.viminfo
set laststatus=2
set sps=best,10
set backspace=2
set whichwrap+=<,>,h,l
set mouse=v
set selection=exclusive
set selectmode=mouse,key
set report=0
set encoding=utf-8
set fileencoding=utf-8
set shortmess=atI
set dictionary+=/usr/share/dict/web2
set splitbelow
"""""""""""""""""""""""""""""""""""
" Interface and themes
"""""""""""""""""""""""""""""""""""
set t_Co=256
set cursorline
syntax enable
set background=dark
colorscheme monokai
"set statusline=%<%h%m%r\ %F%=[%{&filetype},%{&fileencoding},%{&fileformat}]%k\ %-14.(%l/%L,%c%V%)\ %P\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set guifont="DejaVu Sans Mono"\ \ 10
set scrolloff=3
set guioptions-=m
set guioptions-=T
set ruler
set title
set wildmenu
set number
set linebreak
set cc=81
hi ColorColumn ctermbg=235 guibg=#2c2d27
"""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""
set magic
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/
set matchtime=5
""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set formatoptions+=mM
filetype indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype html,xml,xsl source /home/ggarlic/.vim/bundle/closetag.vim/plugin/closetag.vim
"au FileType c setlocal omnifunc=ccomplete#Complete cindent tags+=/home/ggarlic/.vim/systags; | let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf_c.py'
au FileType python setlocal omnifunc=pythoncomplete#Complete | setlocal foldmethod=indent
au FileType python inoremap ,, <ESC>A:<CR>
au FileType go setlocal foldmethod=indent
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O
"goimport
let g:gofmt_command = 'goimports'
"au BufWritePre *.go :Fmt

""""""""""""""""""""""""""""""""""""""""""""""""
"key bindings
""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ,. <ESC>o
"tab navigation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf
"quickfix window
nnoremap <silent> <C-F6> :botright copen<CR>
nnoremap <silent> <C-F7> :cclose<CR>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
"toggle menu and toolbar of gvim
map <silent> <C-F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"use spacebar to fold/unfold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
"write read-only files
cnoremap sudow w !sudo tee % >/dev/null
""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 1
let Tlist_Show_One_File=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
map <C-F12> :!ctags -R --extra=+f --languages=c --langmap=c:+.h --c-kinds=+px --fields=+aiKSz

"nerdtree
map <F4> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
"https://github.com/scrooloose/nerdtree/issues/21
let NERDTreeIgnore = ['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" autoclose and so
let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"] 

"nerd commenter
let NERDShutUp=1

"powerline
"let g:Powerline_symbols='unicode'

"tagbar
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
"showmarks
let g:showmarks_enable = 0

"syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_aggregate_errors = 1


"jedi
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_command = "<leader>d"

"python.vim
let python_highlight_all = 1
let python_version_2 = 1

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
" The Silver Searcher
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command =
                \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    " Fall back to using git ls-files if Ag is not available
    let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif


"gitgutter
let g:gitgutter_escape_grep = 1


" Run current file
func! RunSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi --one-line=keep-statements -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "!python %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    endif
    exec "e! %"
endfunc
noremap <silent><Leader>r :call RunSrc()<CR>

" Toggle paste mode before pasting
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

""==== indentLine ====
if has("gui_running")
let g:indentLine_char = '|'
else
let g:indentLine_char = '¦'
endif

"rainbow_parenthese
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"Python comment
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
    normal o
    call setline('.', '#   Author  :   '.g:python_author)
    normal o
    call setline('.', '#   E-mail  :   '.g:python_email)
    normal o
    call setline('.', '#   Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '#   Desc    :   ')
    normal o
    call cursor(7, 17)
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc

let g:python_author = "fengyun"
let g:python_email = "rfyiamcool@163.com"

au FileType python :%call InsertCommentWhenOpen()
au FileType python map <F2> :call InsertPythonComment()<cr>

"""""""""""""
"commentstring
"""""""""""""
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType mako set cms=##\ %s
