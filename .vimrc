set shell=/bin/bash

set ttyfast
set lazyredraw

let g:ruby_path="~/.rvm/bin/ruby"

" have jsx highlighting/indenting work in .js files as well
let g:jsx_ext_required = 0

let $PATH='/usr/local/bin:' . $PATH

" Sessions
let g:session_autoload = 'no'

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>s :w<CR>
map <Leader>q :wq<CR>
map <Leader>Q :q<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
map <Leader>so :so %<cr>
nnoremap <Leader>p _dP

" disable scroll wheel
:nmap <ScrollWheelUp> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

:imap <ScrollWheelUp> <nop>
:imap <S-ScrollWheelUp> <nop>
:imap <C-ScrollWheelUp> <nop>
:imap <ScrollWheelDown> <nop>
:imap <S-ScrollWheelDown> <nop>
:imap <C-ScrollWheelDown> <nop>
:imap <ScrollWheelLeft> <nop>
:imap <S-ScrollWheelLeft> <nop>
:imap <C-ScrollWheelLeft> <nop>
:imap <ScrollWheelRight> <nop>
:imap <S-ScrollWheelRight> <nop>
:imap <C-ScrollWheelRight> <nop>

:vmap <ScrollWheelUp> <nop>
:vmap <S-ScrollWheelUp> <nop>
:vmap <C-ScrollWheelUp> <nop>
:vmap <ScrollWheelDown> <nop>
:vmap <S-ScrollWheelDown> <nop>
:vmap <C-ScrollWheelDown> <nop>
:vmap <ScrollWheelLeft> <nop>
:vmap <S-ScrollWheelLeft> <nop>
:vmap <C-ScrollWheelLeft> <nop>
:vmap <ScrollWheelRight> <nop>
:vmap <S-ScrollWheelRight> <nop>
:vmap <C-ScrollWheelRight> <nop>

" Reduce timeout after <ESC> is recieved.
set ttimeout
set ttimeoutlen=20
set notimeout

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Leave paste mode on exit
au InsertLeave * set nopaste

" use system clipboard as yank registser
set clipboard=unnamedplus

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set noerrorbells  " No beeps

" Search
set nohlsearch    " No highlight after search
set incsearch     " do incremental searching
set ignorecase    " Case insensitive search
set smartcase     " ...unless search contains uppercase letter

filetype plugin indent on
set t_Co=256
syntax on

" Softtabs, 2 spaces
set smarttab      " better tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent    " Copy indentation from prev line
set smartindent   " I know this probably shouldn't be here
set shiftround    " always indent by multiple of shiftwidth
filetype plugin indent on

set scrolloff=10       " keep at least 10 lines above/below

" Treat given characters as a word boundary
set iskeyword-=.

" Display extra whitespace
set list listchars=tab:»·,trail:·

set smartcase
set ignorecase

set guicursor=

" Numbers
set number
set numberwidth=5
set relativenumber

" Persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Plugins via Plug
call plug#begin('~/.vim/plugged')

Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Telescope settings
" Find files using Telescope command-line sugar.
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Prettier settings
nnoremap <Leader>p <Plug>(Prettier)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Harpoon settings
nnoremap <leader>a <cmd>:lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>h <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>j <cmd>:lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>k <cmd>:lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>l <cmd>:lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>; <cmd>:lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>o <cmd>:lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>i <cmd>:lua require("harpoon.ui").nav_prev()<cr>


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Enable 24 bit color if possible
if (has("termguicolors"))
 set termguicolors
endif

" Color scheme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " or light
colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl' }

" unset background colors
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement. Seemlessly navigate between Vim/Tmux panes
let g:tmux_navigator_no_mappings = 1

" Set markdown file types, and treat .txt files as markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*.txt  set ft=markdown

" disable mouse interactions in vim
set mouse=a

