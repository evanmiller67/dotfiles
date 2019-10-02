runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

let &t_Co=256     " If you would use 256 colors, I would be so happy
set number        " Where am I?
set hlsearch      " Show me what matched
set cursorline    " Where did that cursor go?

hi LineNr term=bold 

syntax enable       " Makes things nice
set shell=bash\ --rcfile\ ~/.bashrc
set expandtab
set tabstop=2       " Set tabs to 2 spaces
set shiftwidth=2    " Set column shift amount
set background=dark " Set background to be dark
"set nocp
"filetype plugin on
filetype plugin indent on

command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e
command! EchoFile echo expand('%:p')

let NERDTreeHijackNetrw=0
let NERDTreeShowHidden=1
let g:zenburn_high_Contrast = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"colorscheme zenburn
"colorscheme jellybeans
silent! colorscheme  slate
silent! colorscheme  solarized
"silent! colorscheme  vimicks

hi VertSplit ctermbg=240
set fillchars+=vert:\ 

iabbrev rpry require 'pry'; binding.pry
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
