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
filetype plugin on "filetype & syntax = syntax highlighting
syntax on
set bg=light
set encoding=utf-8
set number relativenumber
set mouse=a
set clipboard=unnamedplus
set nobackup                    " No auto backups
set noswapfile                  " No swap


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

" Replace ex mode with gq
	map Q gq

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
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

let g:airline_powerline_fonts = 1
