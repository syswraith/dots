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

" call plug#begin()
" " Use release branch (recommended)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" call plug#end()
" 
" " Put this in your init.vim or after/plugin/coc.vim
" 
" " Completion menu (popup) colors
" hi! link Pmenu         GruvboxBg2
" hi! link PmenuSel      GruvboxGray
" hi! link PmenuSbar     GruvboxBg1
" hi! link PmenuThumb    GruvboxGray
" 
" " Coc floating windows
" hi! link CocFloating       GruvboxBg1
" hi! link CocErrorFloat     GruvboxRed
" hi! link CocWarningFloat   GruvboxYellow
" hi! link CocInfoFloat      GruvboxBlue
" hi! link CocHintFloat      GruvboxAqua
" 
" " Coc diagnostics virtual text
" hi! link CocErrorSign   GruvboxRed
" hi! link CocWarningSign GruvboxYellow
" hi! link CocInfoSign    GruvboxBlue
" hi! link CocHintSign    GruvboxAqua
" 
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
