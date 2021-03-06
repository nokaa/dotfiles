" Plug settings
call plug#begin('~/.nvim/plugged')                      "Begin plug section

" Syntax/language specific
Plug 'https://github.com/fatih/vim-go.git'
Plug 'rust-lang/rust.vim'
Plug 'digitaltoad/vim-jade'
Plug 'lambdatoast/elm.vim'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'
Plug 'nokaa/vim.gopher'
Plug 'nokaa/vim.make'
Plug 'idris-hackers/idris-vim'
" Git related
Plug 'airblade/vim-gitgutter'
" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" LISP
Plug 'jpalardy/vim-slime'
Plug 'raymond-w-ko/vim-niji'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'jceb/vim-orgmode'

call plug#end()                                         " End plug section

" Color/syntax settings
set number                                  " Add line numbers
set relativenumber                          " Use relative numbers
syntax on                                   " Add syntax highlighting
set background=dark                         " Use dark background
let g:seoul256_background = 235             " Set seoul256 background to a darker color to match temrinal
colorscheme seoul256                        " Use seoul256 as colorscheme
set nocp                                    " 'compatible' is not set
filetype plugin indent on                   " plugins are enabled
let mapleader=","                           " Remap <Leader> to ,

" Tab settings
set autoindent                              " Set autoindent
set tabstop=4                               " Set tabs to 4 spaces
set expandtab                               " Makes spaces instead of tabs
set shiftwidth=4

" C settings
augroup filetype_c
    autocmd!
    autocmd FileType c setlocal tabstop=8
    autocmd FileType c setlocal noexpandtab
    autocmd FileType c setlocal shiftwidth=8
augroup END

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" haskell-vim settings
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:cabal_ident_section = 2

" vim-slime config
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

" Scheme settings
let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

" Airline config
let g:airline_powerline_fonts = 1

" ctrlp config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Cargo build command
func! CargoBuild()
    execute "!cargo build"
endfu
com! Cargo call CargoBuild()

" Cargo test command
func! CargoTest()
    execute "!cargo test"
endfu
com! CargoT call CargoTest()

" Rustc command
func! RustCompile()
    execute "!rustc ".bufname("%")
endfu
com! Rustc call RustCompile()

" Writing mode
func! WordProcessorMode()
        setlocal formatoptions=1
        map j gj
        map k gk
        setlocal spell spelllang=en_us
        setlocal wrap
        setlocal linebreak
endfu
com! WP call WordProcessorMode()
