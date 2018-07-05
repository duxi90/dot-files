"-------------------------------------------------------------------------------
" Vundle plugin
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'hylang/vim-hy'
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/dhruvasagar/vim-railscasts-theme'
Plugin 'https://github.com/godlygeek/tabular'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------
" OmniCppCompletion plugin
"-------------------------------------------------------------------------------

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" enable global scope search
let OmniCpp_GlobalScopeSearch = 1

"-------------------------------------------------------------------------------
" CTags
"-------------------------------------------------------------------------------
set tags=./tags,tags;

"-------------------------------------------------------------------------------
" Pylint
"-------------------------------------------------------------------------------
autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"-------------------------------------------------------------------------------
" C++
"-------------------------------------------------------------------------------
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"-------------------------------------------------------------------------------
" MaxJ
"-------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.maxj set filetype=java

"-------------------------------------------------------------------------------
" Java
"-------------------------------------------------------------------------------
autocmd FileType java set tags+=.tags~

"-------------------------------------------------------------------------------
" General VIM settings
"-------------------------------------------------------------------------------

colorscheme elflord

" Syntax highlighting
syntax on
filetype on

" Whitespaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
" set list

" Must haves
set hidden
set wildmenu
set showcmd
set hlsearch

" Usability
set backspace=indent,eol,start

" Search options
set ignorecase
set smartcase

set autoindent
set nostartofline

set ruler

set laststatus=2

set confirm

set visualbell
set t_vb=

set number

set notimeout ttimeout ttimeoutlen=200

set pastetoggle=<F11>

" Indentation
set shiftwidth=4
set tabstop=4

" Tab mappings
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tt :tabedit<space>

if has('csope')
	set cscopetag cscopeverbose

	if has('quickfix')
		set ccscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	reabbrev <expr> csa
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
	cnoreabbrev <expr> csf
	 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
	cnoreabbrev <expr> csk
	 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
	cnoreabbrev <expr> csr
	 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
	cnoreabbrev <expr> css
	 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
	cnoreabbrev <expr> csh
	 \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')

	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" Strip trailing whitespace on save
autocmd FileType c,cpp,perl,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" gitcommit message line length to 72 characters
autocmd FileType gitcommit setlocal spell textwidth=72

