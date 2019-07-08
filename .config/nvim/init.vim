set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/vim-latex/vim-latex.git'

" deoplete and dependencies
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dylanaraps/wal.vim'

" markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

call vundle#end()

filetype plugin on

"colorscheme monokai
syntax on

inoremap <C-j> <Esc>/<Enter>"_c5l
inoremap jj <Esc>:up<CR>

let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'

let g:Tex_DefaultTargetFormat = 'pdf'
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" https://stackoverflow.com/questions/3740609/how-do-i-make-vim-latex-compile-correctly-without-having-to-save
autocmd FileType tex call Tex_MakeMap("<Leader>ll", ":w <CR> <Plug>Tex_Compile", 'n', '<buffer>')

autocmd BufEnter,WinEnter,FileType *.cpp,*.h,*.tex,*.py nnoremap #5 <Esc>:w<CR>:!~/.scripts/build.sh %:p <Enter>
autocmd BufEnter,WinEnter,FileType *.cpp,*.h,*.tex,*.py nnoremap <F7> ihello
autocmd BufEnter,WinEnter,FileType *.cpp,*.h,.py set colorcolumn=100

" switch header and source
map <F4> :w<CR>:call CurtineIncSw()<CR>

" set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set mouse=a
set autoread

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set runtimepath^=~/.vim/bundle/ctrlp.vim

" function! DelTagOfFile(file)
"   let fullpath = a:file
"   let cwd = getcwd()
"   let tagfilename = cwd . "/tags"
"   let f = substitute(fullpath, cwd . "/", "", "")
"   let f = escape(f, './')
"   let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
"   let resp = system(cmd)
" endfunction
" 
" function! UpdateTags()
"   let f = expand("%:p")
"   let cwd = getcwd()
"   let tagfilename = cwd . "/tags"
"   let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
"   call DelTagOfFile(f)
"   let resp = system(cmd)
" endfunction
" autocmd BufWritePost *.cpp,*.h,*.c,*.py,*.tex call UpdateTags()

colorscheme wal

