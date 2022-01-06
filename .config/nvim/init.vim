" NEOVIM CONFIG

" Autoinstall Vim-Plug
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugin
call plug#begin(system('echo -n "$HOME/.config/nvim/plugged"'))
	Plug 'ap/vim-css-color'
	Plug 'vimwiki/vimwiki'
    Plug 'vim-airline/vim-airline'
call plug#end()

" Basic
    let mapleader =" "
    filetype plugin on
    syntax on
    set title
    set encoding=utf-8
    set number relativenumber
    set mouse=a
    set clipboard=unnamedplus
    set noswapfile                  " No swap
    set cursorline

" color
    set termguicolors
    set bg=dark
    let g:gruvbox_italic=1
    colorscheme gruvbox

    "hi! LineNr guifg=#282a2e
    "hi! CursorLineNr guibg=#282a2e guifg=1
    "hi! CursorLine  guibg=#282a2e

" autocompletion
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

" Compile document, be it groff/LaTeX/markdown/etc.
    map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
    map <leader>p :!opout <c-r>%<CR><CR>

" Replace ex mode with gq
    map Q gq

" Ensure files are read as what I want:
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
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

" airline
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " powerline symbols
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.dirty='⚡'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = ''
