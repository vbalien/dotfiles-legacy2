call plug#begin('~/.vim/plugged') 

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" 아이콘 폰트 사용
Plug 'ryanoasis/vim-devicons'
" NERDTree
" NERDTree git
Plug 'preservim/nerdtree'
" NERDTree icon color
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Restore Session
Plug 'tpope/vim-obsession'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 컬러 테마
Plug 'tomasiser/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scheakur/vim-scheakur'
Plug 'junegunn/seoul256.vim'

" Language Pack
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" indent 표시
Plug 'Yggdroot/indentLine'

" 코딩시간 측정
Plug 'wakatime/vim-wakatime'

" git status
Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/SyntaxComplete'

call plug#end()

set smartindent
set backspace=2
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set nu
set ruler
set title
set hlsearch
set cursorline
syntax on

set clipboard+=unnamedplus

set laststatus=2
set shell=/bin/bash
set fillchars+=vert:┃

set mouse=a
set encoding=UTF-8


" 단축키 설정
nmap <C-p> :FZF<cr>
nmap <Tab> :NERDTreeToggle<cr>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


" theme config
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

set background=light
colorscheme seoul256-light

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" airline
let g:airline_theme = 'base16'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

" cpp syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" nerdtree
let NERDTreeShowHidden=1 
