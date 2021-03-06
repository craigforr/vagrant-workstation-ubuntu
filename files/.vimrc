" .vimrc ===============================================================
filetype plugin indent on
" Vim ==================================================================
" Vundle ===============================================================
" To set up Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
" Set the runtimepath to include Vundle and initialize
" set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
" Or, for Linux:
" Vundle : Plugin commands go here, between vundle#begin/end.
if has('win32')
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
    set rtp+=~/.vim/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()
endif
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ----------------------------------------------- Vundle Managed Plugins
Plugin 'chriskempson/base16-vim'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
" -- hashivim --
Plugin 'hashivim/vim-hashicorp-tools'
"" " ----
"" " Plugin 'b4b4r07/vim-hcl'
Plugin 'PProvost/vim-ps1'
"" " -- tpope --
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-markdown'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-vinegar'
" ----
Plugin 'vimwiki/vimwiki'
Plugin 'christianrondeau/vim-azure-log-analytics'
Plugin 'machakann/vim-sandwich' " Like vim-surround
" Plugin 'fatih/vim-go' ", { 'do': ':GoInstallBinaries' }
" -- unused --
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'Yggdroot/indentLine'
" Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'nelstrom/vim-markdown-folding'
Plugin 'plasticboy/vim-markdown'
" Plugin 'pseewald/vim-anyfold'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'nelstrom/vim-markdown-folding'
" ----------------------------------------------------------------------
" All Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
set colorcolumn=
"set nowrap
" set encoding=utf-8
" set nobomb " Don't use UTF-8 Byte Order Mark (BOM)
set foldlevel=0
" set guifont=Consolas:h16
" set guifont=Consolas:h15
" set guifont=Roboto_Mono_for_Powerline:h16:cANSI
" set guifont=DejaVu_Sans_Mono_for_Powerline:h14
" Turn on search highlighting
set hlsearch
" Make searches case insensitive by default (required for 'smartcase')
set ignorecase
" Make searches case insensitive by default, unless a capital is used
set smartcase
" Search searching for partial matches immediately
set incsearch
set nobackup
set writebackup
" Break on Words
set linebreak
" scriptencoding utf-8
" lightline ============================================================
" A light and configurable statusline/tabline for Vim
" lightline colorschemes:
"   powerline (default)
"   wombat
"   jellybeans
"   solarized dark
"   solarized light
"   PaperColor light
"   seoul256
"   Dracula
"   one
"   landscape
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ] ]
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1
      \ }
\ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFilename()
"      Second line in return statement used to be:
"      \ ('' != expand('%:f:t') ? expand('%:f:t') : '[No Name]') .
"      ... and only showed the file name.
"      This one shows the parent directory name and the filename:
"      \ ('' != expand('%:p:h:t').'/'.expand('%:t') ?  expand('%:p:h:t').'/'.expand('%:t') : '[No Name]') .
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:p:h:t').'/'.expand('%:t') ?  expand('%:p:h:t').'/'.expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
" Show Syntax Highlighting
syntax on
" ---------------------------------------------- Line Numbering
" Note: Both nu and rnu need to be set in order to toggle between
"       the two using a keybinding/shortcut.
" Show line numbers :nu, :number
set number
" Show relative line numbers :set rnu, :set relativenumber
set relativenumber
" ---------------------------------------------- Visual Indicators
" Display Spaces, Tabs, et al Visibly, :set lcs, listchars
set listchars=eol:$,space:·,tab:¦\
" Show folding indicator in column
set foldcolumn=1
" Split vertically into new window on the bottom
" set splitbelow
" Split horizontally into new window on the right
set splitright
" Allow backspacing over anything and everything
set backspace=indent,eol,start
" Disable beeps and flashes
set novb t_vb=
" Always show the status line, even when there is only a single window
set laststatus=2
" 'display' Comma separated list of flags that change the way text is displayed
"   lastline: When included, as much as possible of the last line in a
"   window will be displayed.
set display+=lastline
" guioptions
" 'a'   Autoselect: Visually highlighted text is available for pasting
"       into other applications as well as into Vim itself.
" 'c'   Use console dialogs instead of popup dialogs.
" 'e'	  Add tab pages when indicated with 'showtabline';
"       Remove 'e' from options when using lightline's tabline.
" 'g'   Make menu items that are not active grey.
" 'i'   Use a Vim icon.
" 'R'   Right-hand scrollbar present for vertically split window.
set guioptions=acgiR
" if has('gui_running')
"     set guioptions-=e
" endif
" Turn of audible and visual bell
set visualbell t_vb=
" Collapse a window completely when it's not the current window
set winminheight=0
" ---------------------------------------------- Keybindings - All Modes
" Leader key
let mapleader=","
" Toggle Spellcheck
nnoremap <F7> :setlocal spelllang=en_us spell! spell?<CR>
" -------------------------------------------- Keybindings - Normal Mode
" Make getting to command mode easier (thanks Damian Conway)
nnoremap ; :
" Make regex 'very magic mode' the default search (thanks Damian Conway)
nnoremap / /\v
" o-- UNUSED -----------------------------------------------------------
" | " Map zt to zz - zz is faster than zt and I scroll to the top more often 
" | " than I scroll to the middle, which is what the zz default is
" | " nnoremap zz zt
" | " Map zt to zm - Think 'm' for middle; when swapped with zt, zt is 
" | " slower and I don't use folding much anyway, which is the zm default
" | " nnoremap zm zz
nnoremap <C-A> ggVG
" Select All
nnoremap <C-A> ggVG
" Paste from Clipboard
nnoremap <C-Y> "+P
" Move down one horizontal split and resize to max
nnoremap <C-N> <C-W>j<C-W>_ 
" Move up one horizontal split and resize to max
nnoremap <C-P> <C-W>k<C-W>_
" Move left one vertical window split
nnoremap <C-H> <C-W>h
" Move down one horizontal split
nnoremap <C-J> <C-W>j
" Move up one horizontal split
nnoremap <C-K> <C-W>k
" Move right one vertical window split
nnoremap <C-L> <C-W>l
" Mimic Windows Ctrl-S to Save
nnoremap <C-S> :w<CR>
nnoremap <A-S> :w!<CR>
" Use Spacebar to pagedown, like a web browser
nnoremap <Space> <PageDown>
" Use Shift-Spacebar to pageup, like a web browser
nnoremap <S-Space> <PageUp>
" Use Ctrl-Backspace to toggle search highlighting
nnoremap <C-BS> :set invhlsearch<CR>
" Use Alt-Backspace to clear search term
nnoremap <A-BS> :let @/="空"<CR>
" Use Alt-/ to toggle colorcolumn at 80 chars
nnoremap <A-/> :let &cc = &cc == '' ? '80' : ''<CR>
" Use Shift-Backspace to toggle word wrap
nnoremap <S-BS> :set nowrap!<CR>
" Use Ctrl-\ to toggle Column Highlight at Cursor
nnoremap <C-\> :set invcursorcolumn<CR>
" Use Ctrl-\ to toggle Row Highlight at Cursor
nnoremap <A-\> :set invcursorline<CR>
" Use Alt-; to toggle Relative Line Numbers
nnoremap <A-;> :set invrnu<CR>
" Use Alt-' to toggle listchars to Display Invisible Characters
nnoremap <A-'> :set invlist<CR>
" Toggle pinning the cursorline to the middle of the window
nnoremap <A-,> :let &scrolloff=999-&scrolloff<CR>
" Cycle through Tabs
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
" Toggle Netrw File Explorer
nnoremap <leader>e :call ToggleNetrw() <CR>
" Show Tab List
nnoremap <leader><Tab><Tab> :tabs<CR>
" Go to the First Tab
nnoremap <leader>0 :tabfirst<CR>
" Go to the Last Tab (the 'Nth' tab)
nnoremap <leader>9 :tablast<CR>
" Go to the Previous Tab (Leftward)
nnoremap <leader>k :tabprevious<CR>
" Go to the Next Tab (Rightward)
nnoremap <leader>j :tabnext<CR>
" Move Tab to the Left
nnoremap <leader><Tab>h :-tabmove<CR>
nnoremap <leader><Tab>k :-tabmove<CR>
" Move Tab to the Right
nnoremap <leader><Tab>l :+tabmove<CR>
nnoremap <leader><Tab>j :+tabmove<CR>
" Move Tab to the Beginning/First
nnoremap <leader><Tab>0 :0tabmove<CR>
" Move Tab to the End/Last
nnoremap <leader><Tab>$ :$tabmove<CR>
" Open Existing Buffer in a New Tab
nnoremap <leader><tab>tsb :ls<cr>:tab sb<space>
" Open New Buffer in a New Tab
nnoremap <leader><Tab>n :tabnew<space>
nnoremap <leader>tn :tabnew<space>
" List Buffers
nnoremap <leader>bb :buffers<cr>:b<space>
" Cycle through Buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
" List Buffers to Delete and place cursor delete
nnoremap <leader>dd :ls<cr>:bd<home>
nnoremap <leader>bd :ls<cr>:bd<space>
" List Buffers and place cursor to switch
nnoremap <leader>ll :ls<cr>:b<space>
nnoremap <leader>ls :ls<cr>:b<space>
" List Buffers and place cursor to split window
nnoremap <leader>sb :ls<cr>:sbuffer<space>
nnoremap <leader>vsb :ls<cr>:vertical :sbuffer<space>
" ------------------------------------------- Keybindings - Command Mode
" Paste from Clipboard
cnoremap <C-Y> <C-R>*
" -------------------------------------------- Keybindings - Insert Mode
" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-D> <Del>
inoremap <C-E> <End>
inoremap <C-F> <Right>
" â is <Alt-B>
inoremap â <C-Left>
" æ is <Alt-F>
inoremap æ <C-Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
" Mimic Windows Ctrl-S to Save
inoremap <C-S> <Esc>:w<CR>a
" Paste from Clipboard
inoremap <C-Y> <C-R>*
inoremap <C-X><C-S> <Esc>:w<CR>a
" Mimic Windows Line Editing in Insert Mode
inoremap <C-BS> <C-W>
" --------------------------------------------- Keybindings - Multi-Mode
" Insert ISO Date : 2017-12-29
nnoremap <F2> "=strftime("%Y-%m-%d")<CR>p
inoremap <F2> <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <F2> <C-R>=strftime("%Y-%m-%d")<CR>
" Insert ISO Date and Time: 2017-12-29 19:59
nnoremap <F3> "=strftime("%Y-%m-%d %H:%M")<CR>p
inoremap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
cnoremap <F3> <C-R>=strftime("%Y-%m-%dT%H%M")<CR>
" Insert Date, Long form: December 29, 2017
nnoremap <F4> "=strftime("%B %d, %Y")<CR>p
inoremap <F4> <C-R>=strftime("%B %d, %Y")<CR>
" ALTERNATIVE " Insert Date as Markdown H1: # Friday, May 3, 2019
" ALTERNATIVE nnoremap <F5> "=strftime("# %A, %B %d, %Y")<CR>p
" ALTERNATIVE inoremap <F5> <C-R>=strftime("# %A, %B %d, %Y")<CR>
" Insert Date, with Day: Friday, May 3, 2019
nnoremap <F5> "=strftime("%A, %B %d, %Y")<CR>p
inoremap <F5> <C-R>=strftime("%A, %B %d, %Y")<CR>
" ------------------------------------------------------------- Autocmds
" Automatically change the current working directory to the path for the
" current file; Note: When this option is on some plugins may not work.
" set autochdir
" Sometimes, as an alternative to setting autochdir, the following
" command gives better results:
autocmd BufEnter * silent! lcd %:p:h
" Git Commit files
autocmd Filetype gitcommit setlocal cc=50,72 tw=72
" ============================================================= Commands
" Format current buffer as JSON with 4 space indents
command! FormatJSON %!jq --indent 4 .
" ------------------------------------------------------------ Go/Golang
au BufNewFile,BufReadPost *.go
    \ set filetype=go |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ----------------------------------------------------------------- HTML
au BufNewFile,BufReadPost *.html
    \ set filetype=html |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ----------------------------------------------------------- JavaScript
au BufNewFile,BufReadPost *.js
    \ set filetype=javascript |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ----------------------------------------------------------------- JSON
au BufNewFile,BufReadPost *.json
    \ set filetype=json |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ------------------------------------------------------------- Markdown
" Indentation and Tabs of 4 spaces are required by Pandoc
au BufNewFile,BufReadPost *.md
    \ set filetype=markdown |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ----------------------------------------------------------- PowerShell
au BufNewFile,BufReadPost *.ps1
    \ set fileformat=dos |
    \ set filetype=ps1 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent
" --------------------------------------------------------------- Python
au BufNewFile,BufReadPost *.py
    \ set fileformat=unix |
    \ set filetype=python |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent
" --------------------------------------------------------------- SQL
au BufNewFile,BufReadPost *.sql
    \ set filetype=sql |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" -------------------------------------------------------- Shell Scripts
au BufNewFile,BufReadPost *.sh
    \ set fileformat=unix |
    \ set filetype=sh |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" -------------------------------------------------------------- Vagrant
au BufNewFile,BufReadPost Vagrantfile
    \ set fileformat=unix |
    \ set filetype=ruby |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ------------------------------------------------------------ Terraform
au BufNewFile,BufReadPost *.tf
    \ set filetype=terraform |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" ---------------------------------------------------------------- YAML
au BufNewFile,BufReadPost *.{yml,yaml}
    \ set filetype=yaml |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=0 |
    \ set expandtab |
    \ set autoindent
" plasticboy/vim-markdown ==============================================
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['bash=sh', 'dosbatch', 'cmd=dosbatch', 'css', 'hcl=terraform', 'html', 'javascript', 'js=javascript', 'json=javascript', 'kql', 'kusto=kql', 'powershell=ps1', 'python', 'sh', 'sql', 'vb', 'vbscript=vb', 'yaml', 'yml=yaml', 'terraform', 'xml']
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
" vim-json =============================================================
let g:vim_json_syntax_conceal = 0
" Vim Post Plugin Config ===============================================
" Highlighting - Cursor
" highlight Cursor guifg=Black guibg=Yellow
" highlight iCursor guifg=Black guibg=Yellow
highlight Cursor guifg=#005f00 guibg=#afdf00
highlight iCursor guifg=#005f00 guibg=#afdf00
" Highlighting - Search
" highlight IncSearch gui=bold guifg=#afdf00 guibg=#005f00
" highlight Search gui=bold guifg=#005f00 guibg=#afdf00
" highlight Search gui=bold guifg=#005f00 guibg=#afdf00
highlight IncSearch gui=bold guifg=#005f00 guibg=#afdf00
highlight Search gui=bold guifg=#bfef00 guibg=#005f00
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
" ======================================================================
" EOF
