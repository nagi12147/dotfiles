" NEOVIM CONFIG

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugin
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'vimwiki/vimwiki'
    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-css-color'
    Plug 'morhetz/gruvbox'
call plug#end()

" Basic
    let mapleader =" "
    set nocompatible
    filetype plugin on
    syntax on
    set title
    set encoding=utf-8
    set number relativenumber
    set mouse=a
    set clipboard=unnamedplus
    set cursorline
    set noshowmode
    set undofile                           " make undo possible after the file is closed and reopened
    set backup                             " make backup files
    set backupdir=~/.local/share/nvim/tmp/backup " where to put backup files
    set directory=~/.local/share/nvim/tmp/swap   " directory to place swap files in
    set viewdir=~/.local/share/nvim/tmp/view     " directory to place view files in
    set undodir=~/.local/share/nvim/tmp/undo     " directory to place undo files in

" color
    set termguicolors
    set background=dark
    colorscheme gruvbox
    hi Normal                  guifg=NONE    guibg=#222222

    if &diff                      " change colorscheme when using vimdiff
        colorscheme gruvbox
    endif

" custom symbols for airline
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_symbols.colnr = ':'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = ' '
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.dirty='⚡'

" autocompletion
    set wildmenu                           " turn on command line completion wild style
    set wildmode=longest,list,full

" disable auto comment on new line
    autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlighting
    set incsearch
    set nohlsearch

" Split
    set splitbelow splitright
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Tab
    set expandtab "Convert tabs to space
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

" Find & Replace
    noremap S :%s//g<Left><Left>

" Replace ex mode with gq
    map Q gq

" Ensure files are read as what I want:
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
    autocmd BufWritePre * let currPos = getpos(".")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e
    autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Run xrdb whenever Xdefaults or Xresources are updated.
    autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
    autocmd VimLeave *.tex !texclear %

" auto delete all trailing whitespace
    autocmd BufWritePre * %s/\s\+$//e

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
