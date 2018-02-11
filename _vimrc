" reference https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/YouCompleteMe
set nocompatible
filetype off
set encoding=utf8

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

let g:ycm_confirm_extra_conf = 0

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" new
Plugin 'gregsexton/gitv'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'jakedouglas/exuberant-ctags'
Plugin 'honza/vim-snippets'
Plugin 'vim-syntastic/syntastic'

" markdown
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
"Plugin 'jtratner/vim-flavoered-markdown'
Plugin 'LanguageTool'

" theme / Interface
Plugin 'AnsiEsc.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'flazz/vim-colorschemes'

Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()

filetype plugin indent on
map <C-]> :YcmCompleter GoToImprecise<CR>
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
set completeopt-=preview


if has('gui_running')
	" gvim-only stuff
	"set guifont=DejaVu\ Sans\ Mono\ 11
	"set guifontwide=WenQuanYi\ Zen\ Hei\ 11
	set guifont=Inconsolata\ 12
	set guifontwide=Inconsolata\ 12
	set linespace=-2
    "set go=
	colorscheme molokai
	let g:molokai_original = 1
    " Enable highlighting of the current line
    set cursorline

else
	" non-gvim stuff
	colorscheme  elflord
	map <F7> :gui<CR>
endif

" new2
set nu
set tabstop=4
set smarttab
set expandtab
set autoindent
set smartindent
set shiftwidth=4
syntax on
set t_Co=256
filetype plugin on
filetype indent on
set hlsearch
set incsearch
set fileencoding=utf8
set termencoding=utf-8


" for cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]

" Vim-PDV Configuration 
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END



" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


" Vim-pencil Configuration
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Vim-UtilSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Ctags
nmap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=~/.vim/systags

" Taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  "设定linux系统中ctags程序的位置
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Show_Menu=1
"let Tlist_File_Fold_Auto_Close=1


" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-

" WinManager
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 30

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" NerdCommenter
let mapleader = ","


"定义打开关闭winmanager按键
nmap <silent> <F8> :WMToggle<cr>

" for quick switch window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" auto load cscope.out
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction

au BufEnter /* call LoadCscope()


" fix quickfix not show
if has('cscope')
  set cscopetag cscopeverbose
  if has('quickfix')
    " set cscopequickfix=s-,c-,d-,i-,t-,e-
    set cscopequickfix=c-,i-,t-,e-
  endif
endif
