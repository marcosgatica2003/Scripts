"Aquí abajo está la configuración de Vundle (el gestor de plugins)
"---------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'sheerun/vim-polyglot'
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on
"---------------------------------------------------------
packadd YouCompleteMe

colorscheme slate

syntax enable

filetype plugin indent on

set termguicolors
set history=500
set encoding=utf-8
set scrolloff=8
set list listchars=tab:»·,trail:·
set foldmethod=manual
set cursorline
set wildmenu
set backspace=2
set vb t_vb=
set autoread
set incsearch
set clipboard=unnamedplus
"set ttyfast
"set lazyredraw
set number

highlight Normal ctermbg=NONE guibg =#131313

"let g:indent_guides_auto_colors = 0
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:Tex_CompileRule_dvi = 'latex -shell-escape -interaction=nonstopmode -file-line-error $*.tex'
let g:Tex_CompileRule_pdf = 'dvipdf $*.dvi tmplatexsuite.pdf; mv tmplatexsuite.pdf $*.pdf'
" Configuración de UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let &t_ut=''
let g:ycm_language_server = [
  \ { 'name': 'cpp', 'cmdline': ['clangd'], 'filetypes': ['cpp', 'c'] }
\]

let g:ale_linters = {
  \ 'cpp': ['clang'],
  \ }
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1
let g:ycm_autocall = 0
let g:ycm_show_status = 0

map <F8> :set number!<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
nnoremap <F8> :TagbarToggle<CR>

""Plantillas
autocmd BufNewFile *.c,*.h 0r ~/.vim/templates/template.c
autocmd BufNewFile *.cpp,*.hpp 0r ~/.vim/templates/template.cpp
autocmd BufNewFile *.ino 0r ~/.vim/templates/template.ino
autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType c,cpp setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType java setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal spell spelllang=es
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=blue   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green  ctermbg=234
autocmd Syntax tex,c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax tex,c,cpp,vim,xml,html,xhtml,perl normal zR

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

inoremap ' ''<Left>
inoremap " ""<Left>


