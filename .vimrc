set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set hlsearch

filetype plugin indent on
syntax enable

command C80 set cc=80

call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
