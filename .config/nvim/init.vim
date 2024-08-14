"  _       _ _         _             |
" (_)_ __ (_) |___   _(_)_ __ ___    |
" | | '_ \| | __\ \ / / | '_ ` _ \   |  $HOME/.config/nvim/init.vom
" | | | | | | |_ \ V /| | | | | | |  |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|  |
" -----------------------------------+
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

set number relativenumber
set omnifunc=ale#completion#OmniFunc
set background=dark
set encoding=utf-8
set number cursorline signcolumn=yes showtabline=2 laststatus=1
set wildmenu
set timeout timeoutlen=500
set autoindent smartindent breakindent
set noshowmode

call plug#begin()
"" General Utilities
Plug 'lilydjwg/colorizer'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/NERDTree'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'wincent/terminus'

"" Autocomplete
Plug 'rip-rip/clang_complete'
Plug 'shougo/deoplete.nvim'
Plug 'w0rp/ale'

"" Languages
Plug 'bfrg/vim-cpp-modern'
Plug 'jceb/vim-orgmode'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'othree/html5.vim'
Plug 'Fymyte/rasi.vim'

"" Colourschemes
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'alessandroyorba/despacio'
Plug 'morhetz/gruvbox'
Plug 'zeis/vim-kolor'
Plug 'arcticicestudio/nord-vim'

Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme nord
let g:NERDTreeWinPos = "right"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:indent_guides_enable_on_vim_startup = 1
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

set guifont =Inconsolata\ Nerd\ Font:h12
au VimEnter * NERDTree | wincmd p
au TermOpen * setlocal nonumber norelativenumber

"" Function Key Remaps
nnoremap <F2> :Startify<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F10> :below terminal<CR>
