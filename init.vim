" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
 "     \ pumvisible() ? "\<C-n>" :
  "    \ CheckBackspace() ? "\<TAB>" :
   "   \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
	  \ coc#pum#visible() ? coc#pum#insert():
	  \ CheckBackspace() ? "\<Tab>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" load vimrc setting
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set hidden

"p Syntax Highlighting
if has("syntax")
	syntax on
endif
filetype off
set autoindent			"자동 들여쓰기
set cindent				"C용 들여쓰기
set	showcmd				"글자계산
set smartindent			"스마트 들여쓰기
set shiftwidth=4		"들여쓰기 4칸
set nuw=2				"number width
set	hls
let g:buffet_show_index=1
"set ic
hi search ctermbg=darkyellow
set list lcs=tab:├─,trail:·
hi CursorLine cterm=NONE ctermbg=235
hi CursorLineNR cterm=bold ctermbg=235
hi VertSplit ctermfg=black ctermbg=black
hi StatusLine ctermfg=black
hi StatusLineNC ctermfg=black
hi! BuffetTab ctermfg=190 ctermbg=234
hi! BuffetBuffer ctermfg=190 ctermbg=234
hi! BuffetCurrentBuffer cterm=bold ctermfg=17 ctermbg=234
hi! BuffetActiveBuffer cterm=bold ctermfg=white ctermbg=234


command Hnw set number! list! cursorline!
command Snw set number list cursorline


set tabstop=4			"탭을 4칸으로
set mouse=n 			"vim에서 마우스 사용
set number				"현재 작업행 표시
set laststatus=2		"상태바 표시 고정
set autowrite			"다른파일 들어가면 자동 저장
set tenc=utf-8			"터미널 인코딩
set fileencoding=utf-8	"파일저장 인코딩
set fencs=ucs-bom,utf-8,euc-kr.latin1 "한글 저장파일은 euc-kr, 유니코드는 유니코드
set history=1000		"vim 편집기록 기억량, .viminfo에 있음
set visualbell 			"키 잘못 누르면 화면프레시
set clipboard=unnamed   "클립보드 사용
set nocompatible 		"vundle
set noswapfile
set backspace=indent,eol,start " Backspace erase option

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs', 'bash=sh' , 'js=javascript', 'py=python', 'c = c++']
set completeopt-=preview
set cursorline
" for indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=darkgreen ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=darkgreen ctermbg=237

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='simple'
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nnoremap <F6> :w<CR>
map <Tab><Left>  <C-W>h
map <Tab><Down>  <C-W>j
map <Tab><Up>    <C-W>k
map <Tab><Right> <C-W>l
map <Tab>= <C-W>=
map <Tab>+ <C-W>+
map <Tab>- <C-W>-
map <Tab>] <C-W>>
map <Tab>[ <C-W><
map	<Tab><Tab>   <Esc>:NERDTreeFocus<cr>
inoremap <S-Tab> <C-V><Tab>
" for vim-dimiactive
let g:diminactive_enable_focus = 1
function! T(...)
	if a:0 == 0
		term ++rows=10
	else
		execute "term ++rows=".a:1
	endif
endfunction
function! VT(...)
	if a:0 == 0
		vert term
	else
		execute "vert term ++cols=".a:1
	endif
endfunction
command -nargs=? TO call T(<f-args>)
command -nargs=? VTO call VT(<f-args>)
map <F3> <Esc>:NERDTreeToggle<cr>
map <C-F3> <Esc>:NERDTreeFocus<cr>
map <S-F3> <Esc>:NERDTree<cr>
map <C>o <Esc>:po<cr>
map <F4> <Esc>:TO<cr>
map <F5> <Esc>:VTO<cr>
"vim-markdown-preview
let g:mkdp_auto_start = 0 "1로설정하면 마크다운 버퍼를 열면 프리뷰를 바로 열 것.
let g:mkdp_auto_close = 1 "1로 설정하면 마크다운 버퍼 닫으면 프리뷰 알아서 바꿔줌.
let g:mkdp_refresh_slow = 0 "0으로 설정하면 커서 움직일때마다 바뀜
" default: 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
let g:mkdp_markdown_css = '/Users/ddinghwan/.config/mkdpcss/markdown.css'


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd FileType cpp let b:coc_pairs_disabled = ['<', '>']
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

let g:loaded_ruby_provider = 0

"gruvbox
let g:gruvbox_italic=1

"coc-prettier :Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)

"command explorer
:nmap <space>e <Cmd>CocCommand explorer<CR>

" GoTo code navigation.
" CTRL + o => goback
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"tagbar toggle
nmap <F8> :TagbarToggle<CR>

"gc : commentary

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'osyo-manga/vim-anzu' "search 시 단어의 개수, 몇번째 단어
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim' "스크롤 스무스
Plug 'itchyny/vim-cursorword' "커서에 밑줄
Plug 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plug 'Lokaltog/vim-easymotion'
Plug 'blueyed/vim-diminactive'
Plug 'anekos/felis-cat-igirisu-toast-express'
Plug 'puremourning/vimspector'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"ro : 환경변수, rf : r 콘솔 시작, \d : 1개 라인 자동넘기기, \l : 1개 라인만
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
call plug#end()

colorscheme gruvbox
