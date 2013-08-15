let &t_Co=256     " If you would use 256 colors, I would be so happy
set number        " Where am I?
set hlsearch      " Show me what matched
set cursorline    " Where did that cursor go?

hi LineNr term=bold 

syntax on         " Makes things nice
set expandtab     " Use spaces instead of \t
set tabstop=2     " Set tabs to 2 spaces
set shiftwidth=2  " Set column shift amount
let g:zenburn_high_Contrast = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1
colorscheme zenburn

hi Search term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
