" Specify a directory for plugins
	"
	call plug#begin('~/.vim/plugged')


	Plug 'scrooloose/nerdtree'
	"Plug 'tsony-tsonev/nerdtree-git-plugin'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	Plug 'ryanoasis/vim-devicons'

	Plug 'airblade/vim-gitgutter'
	"Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
	Plug 'scrooloose/nerdcommenter'

	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'wojciechkepka/vim-github-dark'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'projekt0n/github-nvim-theme', { 'branch': '0.0.x' }

	Plug 'christoomey/vim-tmux-navigator'

	Plug 'nvim-tree/nvim-web-devicons'

	Plug 'morhetz/gruvbox'

	Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

	Plug 'sheerun/vim-polyglot'

	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'yuezk/vim-js'

	Plug 'navarasu/onedark.nvim'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'iamcco/coc-html', {'do': 'yarn install --frozen-lockfile'}
	Plug 'iamcco/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

	Plug 'alvan/vim-closetag'

	Plug 'mattn/emmet-vim'
	"Plug 'ThePrimeagen/harpoon'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Plug 'jiangmiao/auto-pairs'
" Initialize plugin system
call plug#end()

let mapleader=" "

let g:gruvbox_contrast_dark = "medium"
set background=dark

let g:onedark_config = {
    \ 'style': 'darker',
\}


colorscheme onedark

" after colorscheme is applied remove the background color so it always
" matches the terminal background
highlight Normal guibg=none
highlight SignColumn guibg=none
highlight FoldColumn guibg=none
highlight VertSplit guibg=none
highlight NonText guibg=none
highlight ColorColumn guibg=none
highlight EndOfBuffer guibg=none




" telescope keymapping
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p> :History<CR>

" enable rainbow brackets globally
let g:rainbow_active = 1

inoremap jk <ESC>
nmap <C-f> :NERDTreeToggle<CR>

" open terminal with ctrl t
nmap <C-t> :sp term://bash<CR><C-w>15-



" SAVE A SESSION WITH ALT {1, 2, 3}
noremap <M-1> :mks! ~/.s.vim<CR>
noremap <M-2> :mks! ~/.s2.vim<CR>
noremap <M-3> :mks! ~/.s3.vim<CR>

" refresh the source of vim
noremap <leader>r :source ~/.config/nvim/init.vim<CR>
noremap <M-t> :PlugInstall<CR>

"save with ctrl s
noremap <C-s> :wa<CR>
"
" dont open any empty tabs when i reopen a session
" works especially with nerdtree
set sessionoptions-=blank


nmap \\ <plug>NERDCommenterToggle
vmap \\ <plug>NERDCommenterToggle
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv


" additional
" change emmet shortcut
let g:user_emmet_leader_key='<C-t>'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'

" Enable coc.nvim extensions for JSX and HTML
autocmd FileType javascript.jsx setl filetype=javascript
autocmd FileType javascript.jsx setl completefunc=javascriptcomplete#CompleteJSX
autocmd FileType html setl completefunc=htmlcomplete#CompleteTags

autocmd FileType html,jsx setlocal omnifunc=htmlcomplete#CompleteTags



" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


set relativenumber
set number
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set autoindent
set nocompatible
set modifiable

" run prettier on auto save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" NERDTree Config

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



lua require("gunblade.plugins-setup")
lua require("gunblade.plugins.lualine")
" auto completion plugin, i have another one above
"lua require("gunblade.plugins.nvim-cmp")
lua require("gunblade.plugins.autopairs")
lua require("gunblade.core.keymaps")


" COC CONFIG



" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)


inoremap <expr> <Enter> pumvisible() ? "\<C-Y>" : v:lua.MPairs.completion_confirm()
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" fox stuff

" after colorscheme is applied remove the background color so it always
" matches the terminal background
highlight Normal guibg=none
highlight SignColumn guibg=none
highlight FoldColumn guibg=none
highlight VertSplit guibg=none
highlight NonText guibg=none
highlight ColorColumn guibg=none
highlight EndOfBuffer guibg=none

""save with ctrl s
noremap <C-s> :wa<CR>

" dont open any empty tabs when i reopen a session
" works especially with nerdtree

"nmap <C-f> :NERDTreeToggle<CR>
"nmap <C-_>   <Plug>NERDCommenterToggle
"vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" additional
" change emmet shortcut
let g:user_emmet_leader_key='<C-t>'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'


" Enable coc.nvim extensions for JSX and HTML
autocmd FileType javascript.jsx setl filetype=javascript
autocmd FileType javascript.jsx setl completefunc=javascriptcomplete#CompleteJSX
autocmd FileType html setl completefunc=htmlcomplete#CompleteTags

autocmd FileType html,jsx setlocal omnifunc=htmlcomplete#CompleteTags


" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

