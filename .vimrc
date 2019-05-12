""" VIMRC DOC TOP
set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"The following are examples of different formats supported.
"Keep Plugin commands between vundle#begin/end.
"plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"The sparkup vim script is in a subdirectory of this repo called vim.
"Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Install L9 and avoid a Naming conflict if you've already installed a
"different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'SirVer/UltiSnips'
"Plugin 'honza/vim-snippets'
"Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" VIMRC
"set rtp+=/home/brett/.vim/
filetype plugin on
syntax on

"let &titlestring = @%
set title
set guitablabel=\[%N]\ %t\ %M

nnoremap <C-P> :cd ~/Clients/<CR>:e **/*

"set background=light
set background=dark
set t_Co=16
"color desert

""" GVIM SCREEN SETTINGS
if has("gui_running")
    "set lines=999 columns=999
    set guifont=Inconsolata\ 11
endif

""" AUTOCOMMAND
if has("autocmd")
    augroup Brett
        autocmd!
        autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
        autocmd bufwritepost .vimrc :source /home/brett/.vimrc
        autocmd filetype python nnoremap <buffer> <F8> :exec '!python' shellescape(@%, 1)<cr>
        ""prevent zip#browse errors when vimgreping
        autocmd BufReadCmd *.xlsx call zip#Browse(expand("<amatch>"))
        autocmd BufReadCmd *.docx call zip#Browse(expand("<amatch>"))
        autocmd FileType qf :call brettfunctions#AdjustWindowHeight(20, 30)
        autocmd InsertLeave * highlight cursor    guibg=yellow guifg=blue
        autocmd InsertEnter * highlight cursor    guibg=White
        autocmd FileType tex setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
        "autocmd BufEnter * silent! lcd %:p:h
        """au insertleave * hi cursor    guibg=#122ea2 guifg=Blue
        "autocmd FileType markdown setlocal color desert
    augroup end
endif
""" COMMMANDS FOR FUNCTIONS
command! -nargs=* MKD :call brettfunc#MarkdownLevel(<f-args>)
command! -nargs=* ProcessXMLFile :call brettfunc#ProcessXMLFile(<f-args>)
command! -nargs=1 ICIAudit call brettfunc#ICIAudit(<f-args>)
command! -nargs=* BracketSpace :call brettfunc#BracketSpace()
command! -nargs=1 ClientCorePagesReport call brettfunc#ClientCorePagesReport(<f-args>)
command! CompleteTodoz execute 'normal! mm0i[X] `m'
command! -nargs=* AdmKwSuggestionsz :call KwSuggestions(<f-args>)
command! -nargs=* AdmKwDetailsz :call KwDetails()
command! -nargs=* AdmKeywordDupesz :call RemoveKeywordDuplicates(<f-args>)
command! OpenBrowser :exe ':silent !google-chrome %'

command! -nargs=* CleanKeywordsRankTracker :call brettfunctions#CleanKeywordsRankTracker()
command! -nargs=* CleanKeywordsMerge :call brettfunctions#CleanKeywordsMerge()
command! -nargs=1 Batbelt silent! :call Batbelt(<f-args>)
command! -nargs=* Audit silent! :call Test("company")
command! -nargs=* Todo :call Todo()
command! -nargs=* Reports :call Reports()

"command! -nargs=1 Audit silent! :call brettfunctions#Audit("company")
"command! OpenBrowser :silent ! start google-chrome "file://%:p"
"command! -nargs=* DeleteFilez :call DeleteFileInBuffer(<f-args>)
"command! -nargs=* AdmKeywordDupesz :call RemoveKeywordDuplicates(<f-args>)
"command! -nargs=* AdmREPLACEz :call FindAndReplaceAll(<f-args>)
"command! -nargs=* CleanKeywords :call mergetemplates#CleanKeywords()

""" MY LEGACY SETTINGS
""todo: May0619 figure out why localleader not working consistently
nnoremap ,a :source ~/audit.vim<CR>
"nnoremap aud :source /home/brett/audit.vim<CR>
"nnoremap <localleader>t :source ~/audit.vim<CR>
"nnoremap ,t :source ~/audit.vim<CR>

nnoremap J gJ
nnoremap <F21><F21> @q

"" MAPLEADERS
let mapleader="\<space>"
let maplocalleader=","

vnoremap <leader>url :call brettfunc#UrlLink()<CR>
vnoremap <leader>urd :call brettfunc#UrlLinkRepeat()<CR>

"" SET COMMNANDS
" HOPEFULLY SCROLL FASTER ON LINUX
set timeoutlen=1000
set ttimeoutlen=10
set showcmd
set re=1
set formatoptions-=tc
set nowrap
set linespace=3
set gdefault
set cursorline
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu bar
set guioptions-=r  "remove right-hand scroll bar
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:»~,trail:$,extends:>,precedes:<,eol:¬
set number
set path=.,,/home/brett/.vim/**
set smartcase
set spellsuggest=fast,10

"" WILD MENU
set wildignorecase
set wildmenu
set wildmode=full


nnoremap s <C-w>
nnoremap <C-n> :next<CR>
nnoremap <C-p> :previous<CR>

"" FIX LINUX CLIPBOARD
set clipboard=unnamedplus

"" CLEAR SEARCH HIGHLIGHT
nnoremap <space><space> :nohl<CR>

"" FILE FORMAT TO UNIX
nnoremap <leader>unix :set ff=unix<CR>

"" NORMAL MODE MAPPINGS
nnoremap <leader>tt :normal! mm[s1z=`m<CR>
"cycle through splits
nnoremap ,, <C-w>w
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>gv :e $HOME/.gvimrc<CR>
nnoremap <leader>en :e ~/.config/nvim/init.vim<CR>
"nnoremap <silent> <CR> :nohl <CR>
"move up/down visual lines
nnoremap j gj
nnoremap k gk
"set word wrap
nnoremap <silent> <S-F5> :set wrap!<CR>
 
"insert mode mappings
inoremap jj <Esc>
"set foldmethod=marker

function! Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunction

"" COMMAND LINE MAPPINGS
cab eee e ~/dropbox/clients/ <left><C-R>=Eatchar('\s')<CR>
cab rrr r ~/dropbox/clients/ <left><C-R>=Eatchar('\s')<CR>
cab sss saveas ~/dropbox/clients/ <left><C-R>=Eatchar('\s')<CR>

"" CHANGE CASE OF FIRST WORD OR ALL WORDS IN LINE
function! Pro()
    "normal :s/\<./\u&/
    execute ':s/\<./\u&/'
    "execute ':s/\<./\u&/'
endfunction
nnoremap <leader>pro :call Pro()<cr>
vnoremap <leader>pro :call Pro()<cr>

function! Fir()
    "normal :s/\<./\u&/
    execute 's/^./\u&/'
endfunction
nnoremap <leader>fir :call Fir()<cr>
vnoremap <leader>fir :call Fir()<cr>

function! BracketSpace()
    silent execute '%s#\[\]#[\\, \\,]'
    normal gg
endfunction

""" ABBREVIATIONS
ab lac {\lac}
ab mto many-to-one
iab <expr> dt strftime('%b%d%y')
"backup iab <expr> dt strftime('%b%d%y')
"iab <expr> dts strftime('%b%d%y-%I-%M%p')
"iab <expr> dt strftime('%b%d%y-%I-%M%p')
iab <expr> fil expand('%:t')
iab <expr> pat expand('%:p')
iab <expr> ses expand('%:g:this_session')
iab <expr> info expand('%:g:this_session','%:t')

"" END LEGACY SETTINGS ---------------------------------------------

""" CURSOR COLORS
highlight Cursor guifg=black guibg=yellow
highlight Cursorline guifg=grey10 guibg=grey30

""" STATUSLINE
"highlight StatusLine guifg=red guibg=grey20
"highlight StatusLineNC guifg=grey20 guibg=grey25
set statusline=
set statusline+=%{getcwd()}
set statusline+=%=
set statusline+=[%f]
set statusline+=%7l/
set statusline+=%-7L

""" COLOR FAMILY UNDER CURSOR
nnoremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

""BASICS"{{{
filetype plugin indent on    " required
filetype plugin on
filetype on
syntax on
"change this to 250 on laptop
"winpos 1250 0
":cd $HOME/Dropbox/clients

""}}

""NNOREMAP"{{{

nnoremap ' `
nnoremap ,, <C-w>w
nnoremap ,z za
nnoremap <S-j> <Nop>
nnoremap gb :ls<CR>:b<space>
nnoremap <localleader>b :bn<cr>
nnoremap <localleader>j <S-j>
nnoremap <silent> <C-A-F5> :call ToggleSpelling()<CR>
nnoremap <silent> <C-CR> o<Esc>
nnoremap <silent> <C-F11> <C-w>=
nnoremap <silent> <C-F12> <C-w>=
nnoremap <silent> <C-S-F5> :set relativenumber!<CR>
nnoremap <silent> <C-UP> ddkP
nnoremap <silent> <S-A-F5> :set spell!<CR>
nnoremap <silent> <C-down> ddp
nnoremap <silent> <DOWN> :cnext<CR>
nnoremap <silent> <F10> <C-w>x
nnoremap <silent> <F11><F11> <C-w>_
nnoremap <silent> <F12><F12> <C-w><BAR>
nnoremap <silent> <F5> :set list!<CR>
nnoremap <silent> <F7> "0p
nnoremap <silent> <F8> Gokkidt
nnoremap <silent> <F9> :cd %:p:h<CR>i<ESC>
nnoremap <silent> <S-CR> O<Esc>
nnoremap <silent> <S-F5> :set wrap!<CR>
nnoremap <silent> <UP> :cprev<CR>
nnoremap <silent> <leader><space> :nohl<CR>
nnoremap <silent> <leader>bbb :call brettfunctions#Backup()<CR>| "create backup of file with date/time stamp
nnoremap <silent> <leader>c mz0i"<ESC>`z
nnoremap <silent> <leader>f <C-w>w
nnoremap <silent> <leader>k <C-^> :bd #<CR>
nnoremap <silent> <leader>q :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
nnoremap <silent> <leader>raa <S-@>a
nnoremap <silent> <leader>u 0x"<ESC>
nnoremap <silent> <leader>vs <C-w>v<C-w>w :e blank<CR>
nnoremap <silent> <leader>x <C-w>x
nnoremap <silent> <localleader>ct :%s///gn<CR>
nnoremap <silent> <localleader>f :call brettfunctions#FoldColumnToggle()<CR>
nnoremap <silent> FF mmf-lvllrk'm
nnoremap <silent> KK mmg_a-kkk'mj
nnoremap <silent> M @m
nnoremap <silent> Q @q
nnoremap <silent> QQ mmg_a-qqq'mj
nnoremap <silent> TT mmg_a-!!!'mj
nnoremap <silent> XX mmg_hhhD`m
"nnoremap <silent><F4> @l
nnoremap <silent><localleader>m :g//m$<CR>
"nnoremap <silent><localleader>q :botright cwindow<CR><CR> <C-w><C-p>
nnoremap B <S-l>
nnoremap H <S-^>
nnoremap L g_
nnoremap M <S-m>
nnoremap Y y$
nnoremap ` '
nnoremap j gj
nnoremap k gk
nnoremap <silent> <F2> :!start C:/Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>
nnoremap <C-J> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <leader>w :vertical resize +10<CR>
nnoremap <leader>n :vertical resize -10<CR>

"nnoremap <silent> H @h
nnoremap <silent> n nzz:call brettfunc#HLNext(0.05)<CR>
nnoremap <silent> N Nzz:call brettfunc#HLNext(0.05)<CR>
nnoremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

""" FILE PATHHS
nnoremap <silent> <leader>vim :cd~/Dropbox/@VimNotes<CR>:pwd<CR>
nnoremap <C-S-F8> :e ~/dropbox/wiki/wikiSystemInBox.md<CR>
nnoremap <silent> <leader>party :cd~/Dropbox/PartyBusiness<CR>:pwd<CR>
nnoremap <silent> <leader>plug :cd~/vimfiles/plugin<CR>
nnoremap <silent> <leader>prob :e ~/dropbox/clients/ctproblend/notesProblend.md<cr>
nnoremap <silent> <leader>pros :e ~/dropbox/clients/ctprospects/notesProspects.md<cr>
nnoremap <silent> <leader>eb :e ~/dropbox/projects/vimnotes/notesVim.md<cr>
nnoremap <silent> <leader>ec :e ~/Dropbox/wiki/commands-computer.md<cr>
nnoremap <silent> <leader>ef :e ~/vimfiles/autoload/brettfunctions.vim<cr>
nnoremap <silent> <leader>ei :e ~/dropbox/projects/icigeneral/notesICI.md<cr>
nnoremap <silent> <leader>el :e ~/dropbox/projects/latex/icizohodocumentation/zohoDocumentation.tex<cr>
nnoremap <silent> <leader>ep :cd ~/dropbox/projects<cr>
nnoremap <silent> <leader>eq :e ~/dropbox/projects/qcp-painting/notesQCP.md<cr>
nnoremap <silent> <leader>es :e ~/dropbox/scratch.md<cr>
nnoremap <silent> <leader>ev :e ~/.vimrc<cr>
nnoremap <silent> <leader>ew :e ~/dropbox/wiki/wikicontent.md<cr>
nnoremap <silent> <leader>ek :e ~/dropbox/wiki/wikiContent.md<cr>

""" HELPER PRODUCTION FILES
nnoremap <leader>gil :e ~/Dropbox/clients/batbelt/gilligan.txt<cr>
nnoremap <leader>gin :e ~/Dropbox/clients/batbelt/ginger.txt<cr>
nnoremap <leader>iro :e ~/Dropbox/clients/batbelt/ironman.txt<cr>
nnoremap <leader>mar :e ~/Dropbox/clients/batbelt/maryann.txt<cr>
nnoremap <leader>pro :e ~/Dropbox/clients/batbelt/professor.txt<cr>
nnoremap <leader>ski :e ~/Dropbox/clients/batbelt/skipper.txt<cr>
nnoremap <leader>spi :e ~/Dropbox/clients/batbelt/spiderman.txt<cr>
nnoremap <leader>sup :e ~/Dropbox/clients/batbelt/superman.txt<cr>
nnoremap <leader>tho :e ~/Dropbox/clients/batbelt/thor.txt<cr>
nnoremap <leader>bre :e ~/Dropbox/clients/nbrett.md<cr>
nnoremap <leader>cli :e ~/Dropbox/clients/
nnoremap <leader>ici :e ~/Dropbox/clients/nICI.md<cr>
nnoremap <leader>prob :e ~/Dropbox/clients/nProblend.md<cr>
nnoremap <leader>pros :e ~/Dropbox/clients/nProspects.md<cr>
nnoremap <leader>psm :e ~/Dropbox/clients/nPSM.md<cr>


vnoremap <silent> <C-F8> :'<,'> w! >> ~/dropbox/wiki/wikiInbox.md<cr>:'<,'>d<cr>
vnoremap // y/<C-R>"<CR>
vnoremap <C-down> xp`[V`]
vnoremap <C-up> xkP`[V`]
vnoremap <silent> <localleader>s @o

inoremap <C-d> <ESC>ddi
inoremap jj <Esc>


set autochdir
set foldlevelstart=9
set lazyredraw

let mapleader = "\<Space>"
let maplocalleader = ","
let @o = ':sort /\ze\%V/'
let @c = 'df jdf iÂkb    j0df iÂkb  j0df iÂkb  0jc'
let @l = ']sez='

"" CHANGE LINUX MATE CURSOR ON MODE
":test
"" https://forums.linuxmint.com/viewtopic.php?t=139347
let &t_SI = "\<Esc>[5 q"
"let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

""" ULTISNIPS
let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsSnippetsDir = '~/Dropbox/UltiSnipsPrivate'
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/snippets', '~/Dropbox/UltiSnipsPrivate']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
"let g:UltiSnipsSnippetDirectories = ['~/vimfiles/bundle/vim-snippets/ultisnips', 'ultisnips']
"let g:UltiSnipsSnippetDirectories = ['~/vimfiles/bundle/vim-snippets/ultisnips', 'ultisnips', '~/Dropbox/UltiSnipsPrivate']
"let g:UltiSnipsSnippetsDir = '~/UltiSnipsPrivate'
""" NETRW
let g:netrw_list_hide='.*\.add,.*\.ai,.*\.png,.*\.pdf,.*\.docx,.*\.stk,.*\.bak,.*\.lnk,.*\.aux,.*\.css,.*\.csv,.*\.cust,.*\.gif,.*\.gitignore,.*\.gsheet,.*\.htmt,.*\.idx,.*\.ilg,.*\.ind,.*\.jpg,.*\.log,.*\.lol,.*\.out,.*\.spl,.*\.svx,.*\.swm,.*\.swn,.*\.swo,.*\.swp,.*\.toc,.*\.txt,.*\.vim,.*\.xls,.*\.xlsx,.*\.zip'
let g:netrw_sort_options = "i"
let g:netrw_preview=1
let g:netrw_winsize=50
let g:netrw_hide=1
let g:netrw_banner=0
let g:netrw_browsex_viewer="setsid xdg-open"
let g:netrw_gx="<cWORD>"
let @n = 'i.*\.$a,j0'
let @m = ':let @u=@qÂkb(Âkb*k0f[va["ny0ji[A]"nph$a  jjo"nphA:ÂÃ¼ jj"upajjk:wk'
let @h = '0wvg_Ui-------------------- hhhhh'
let g:ackprg = 'ag --nogroup --nocolor --column'
let @s = "]syiwmmGiAkp'm"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""" FUNCTIONS
function! ClearEOL()
    execute "normal! mmg_hhhD\<ESC>'m"
endfunction
:command! -nargs=* Clear :call ClearEOL(<args>)

function! Todo()
    execute ':cd ~\dropbox\clients'
    execute ':vim /^todo:/ **/*.md'
    execute ':botright cwindow'
endfunction

function! DeleteFileInBuffer()
    :call delete(expand('%')) | bdelete!
endfunction
:command! -nargs=* DeleteFilez :call DeleteFileInBuffer(<f-args>)

function! ToggleSpelling()
    :set spell!
endfunction
:command! -nargs=* SpellOnz :call ToggleSpelling(<f-args>)

"" BLINK CURSOR ON SEARCH
set guicursor=a:blinkon2000| "cursor blink speed in ms
nnoremap <silent> n n:call brettfunc#HLNext(0.05)<CR>
nnoremap <silent> N N:call brettfunc#HLNext(0.05)<CR>

"" CLEAN UP PIP POST MERGE LINES
function! PostMerge()
    silent! execute 'g/>>>/d'
    silent! execute '%s/\%x92/''/e'
    silent! execute '%s/\%x93/"/e'
    silent! execute '%s/\%x94/"/e'
    normal gg
endfunction

function! ProperCase()
    execute ':s/\<./\u&/'
endfunction
vnoremap <leader>p :call ProperCase()<cr>

function! Pro()
    "normal :s/\<./\u&/
    execute ':s/\<./\u&/'
endfunction
vnoremap <leader>pro :call Pro()<cr>


""" FUNCTION: ADD KEYWORD INSTANCES TOP
function! AddKeywords()
    call ClearBatbeltRegisters()
    call ClearBatbeltMappings()
    normal gg
    "silent execute '/TERM'
    silent execute '/LOWER'
    silent execute 'normal f:lvg_"ky'
    let @d = '%s#Master#\="Scooby"." ".@k."."'
    let @f = '%s#Panic#\="Thelma"." ".@k."."'
    "" WORKING LINES BEFORE TESTING INSERTING SPACE BEFORE TERM
    "let @d = '%s#Medeco#\="Scooby" . @k . ""'
    "let @f = '%s#Schlage#\="Thelma" . @k . ""'
    normal gg
    sleep 500m
    execute '@f'
    sleep 500m
    execute '@d'
endfunction

function!  UrlLink()  
    let @u = @+  
    normal gv"cy  
    normal gvd  
    normal i<a href="  
    normal "upa">  
    normal ""p  
    normal a</a>l  
    execute 'nohl'  
endfunction  
