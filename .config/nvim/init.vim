" Plug settings
call plug#begin('~/.nvim/plugged')                      "Begin plug section

Plug 'https://github.com/fatih/vim-go.git'
Plug 'rust-lang/rust.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'digitaltoad/vim-jade'
Plug 'lambdatoast/elm.vim'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'
Plug 'flazz/vim-colorschemes'

call plug#end()                                         " End plug section

" Color/syntax settings
set number			                        " Add line numbers
syntax on			                        " Add syntax highlighting
set background=dark                                     " Use dark background
let g:seoul256_background = 235                         " Set seoul256 background to a darker color to match temrinal
colorscheme seoul256                                    " Use seoul256 as colorscheme
"colorscheme solarized                                   " Use solarized as colorscheme
"colorscheme tutticolori
"colorscheme twilight256
"colorscheme mango
"colorscheme moria
set nocp			                        " 'compatible' is not set
filetype plugin indent on	                        " plugins are enabled

" Tab settings
set autoindent			                        " Set autoindent
set tabstop=8			                        " Set tabs to 8 spaces
set expandtab			                        " Makes spaces instead of tabs
set shiftwidth=8


" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" rust.vim settings
let g:rustfmt_autosave = 1

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

" List of plugins installed
" plug: https://github.com/junegunn/vim-plug
" vim-go: https://github.com/fatih/vim-go.git
" vim-colors-solarized: https://github.com/altercation/vim-colors-solarized
" vim-jade: https://github.com/digitaltoad/vim-jade
" elm.vim: https://github.com/lambdatoast/elm-vim
" vim-toml: https://github.com/cespare/vim-toml
" haskell-vim: https://github.com/neovimhaskell/haskell-vim
