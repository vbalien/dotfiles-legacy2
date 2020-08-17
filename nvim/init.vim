call plug#begin('~/.local/share/nvim/plugged')

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

" indent 표시
Plug 'Yggdroot/indentLine'

" 코딩시간 측정
Plug 'wakatime/vim-wakatime'

" git status
Plug 'airblade/vim-gitgutter'

" Auto Complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

Plug 'vim-scripts/SyntaxComplete'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'

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

" LSP
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ }
execute 'autocmd FileType '
  \ . join(keys(g:LanguageClient_serverCommands), ',')
  \ . ' autocmd BufWritePre <buffer> call LanguageClient#textDocument_formatting_sync()'

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
set shortmess+=c
set completeopt-=preview

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
