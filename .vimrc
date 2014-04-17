runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

let &t_Co=256     " If you would use 256 colors, I would be so happy
set number        " Where am I?
set hlsearch      " Show me what matched
set cursorline    " Where did that cursor go?

hi LineNr term=bold 

syntax enable     " Makes things nice
set expandtab
set tabstop=2     " Set tabs to 2 spaces
set shiftwidth=2  " Set column shift amount
filetype plugin indent on

command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e

let NERDTreeHijackNetrw=0
let g:zenburn_high_Contrast = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1
"colorscheme zenburn
colorscheme jellybeans
" candyman
" solarized

iabbrev rpry require 'pry'; binding.pry
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
