call plug#begin('~/.vim/plugged') 

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" 아이콘 폰트 사용
Plug 'ryanoasis/vim-devicons'

" Start page
Plug 'mhinz/vim-startify'

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
Plug 'dracula/vim', { 'as': 'dracula' }

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Language Pack
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" indent 표시
Plug 'Yggdroot/indentLine'

" 코딩시간 측정
Plug 'wakatime/vim-wakatime'

" git status
Plug 'airblade/vim-gitgutter'

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
syntax enable
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif

set clipboard=unnamed
" set clipboard+=unnamedplus

set laststatus=2
set shell=/bin/bash
set fillchars+=vert:┃

set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

set encoding=UTF-8

" theme config
let g:dracula_italic = 0
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" 단축키 설정
nmap <C-p> :FZF<cr>
nmap <Leader>p :FZF<cr>
nmap <Tab> :NERDTreeToggle<cr>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" detect extension
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead .eslintrc set filetype=json

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" airline
let g:airline_theme='dracula'
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
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:indentLine_char='│'
let g:indentLine_color_gui='gray'


"""
" Coc
"""
" Use K to show documentation in preview window.
nmap <leader>f  <Plug>(coc-codeaction)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  call CocActionAsync('doHover')
endfunction
