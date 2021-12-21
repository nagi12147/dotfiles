" NEOVIM CONFIG

" Autoinstall Vim-Plug
if ! filereadable(system('echo -n "$HOME/.config/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugin
call plug#begin(system('echo -n "$HOME/.config/nvim/plugged"'))
	Plug 'ap/vim-css-color'
call plug#end()

" Basic
filetype plugin on "filetype & syntax = syntax highlighting
syntax on
set bg=light
set encoding=utf-8
set number
set mouse=a
set clipboard=unnamedplus

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
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Find & Replace
noremap S :%s//g<Left><Left>

" Autohapus spasi ga jelas
autocmd BufWritePre * %s/\s\+$//e
