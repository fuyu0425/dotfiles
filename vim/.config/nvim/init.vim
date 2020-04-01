if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

set nocompatible              " be iMproved, required
filetype off                  " required
"Vundle
" call vundle#rc(s:editor_root . '/bundle')
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'        " This is for awesome outlook
Plug 'vim-airline/vim-airline-themes' " This is for awesome outlook
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
" Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ekalinin/Dockerfile.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'embear/vim-localvimrc'
Plug 'Yggdroot/indentLine'
Plug 'mkitt/tabline.vim'
" Plug 'let-def/vimbufsync'
" Plug 'https://framagit.org/tyreunom/coquille'
" Plug 'vim-scripts/vim-auto-save'
Plug 'terryma/vim-multiple-cursors'
Plug 'cespare/vim-toml'
call plug#end()            " required
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
set t_Co=256
syntax enable
syntax on
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""format for c++""
let g:autoformat_verbosemode=1
let g:formatdef_clangformat = '"clang-format -style=WebKit"'
let g:airline#extensions#ale#enabled = 1

" airline
" let g:airline#extensions#tabline#enabled = 1
noremap <F3> :Autoformat<CR>
set laststatus=2
" set statusline+=%#warningmsg#
set title
set encoding=utf-8
set fileencodings=utf-8
set number
set relativenumber
set showcmd
set autochdir
set cursorline
set cursorcolumn
set ruler
set wrap
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set confirm
set ignorecase smartcase
set hlsearch
set tabstop=4
"colors
set t_Co=256
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
"
filetype plugin indent on
filetype plugin on
set shell=/bin/zsh\ -l

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \'file': '\v\.(exe|so|dll)$',
            \'link': 'some_bad_symbolic_links',
            \}
"let g:ctrlp_user_command = 'find %s -type f
se makeprg=g++\ %\ -Wall\ -Wshadow\ -std=c++14\ -o\ %<

map <F10> :make <CR>:!./%< < %<.in <CR>
au FileType c map <F9> :call C()<CR>
func C()
    exec "w"
    exec "!gcc -D fuyu0425 % -o %<"
    exec "! ./%<"
endfunc
au FileType cpp map <F9> :call CPP()<CR>
func CPP()
    exec "w"
    exec "!g++ -D fuyu0425 % -o %<"
    exec "! ./%<"
endfunc
au FileType python map <F9> :call PY()<CR>
func PY()
    exec "w"
    exec "!chmod +x %"
    exec "! ./%"
endfunc
map <C-A> ggVG"+y"
vmap <C-C> "+y"
nnoremap <F5> :NERDTreeToggle<CR>
nmap <silent> <leader>t :NERDTreeTabsToggle
"let g:nerdtree_tabs_open_on_console_startup = 1
" autocmd FileType apiblueprint nnoremap <C-b> :call GenerateRefract()<cr>
" syntax checking
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs=0
let g:syntastic_echo_current_error=0

let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsSnippetDirectories=['UltiSnips']

let g:NERDSpaceDelims=1

map cc  <leader>cc
map cn  <leader>cn
map <C-_> <leader>c<space>
imap <C-_> <ESC><leader>c<space> i

" dirty hack
cmap w!! w !sudo tee > /dev/null %

let g:rainbow_levels = [
            \{'ctermfg': 2, 'guifg': '#859900'},
            \{'ctermfg': 6, 'guifg': '#2aa198'},
            \{'ctermfg': 4, 'guifg': '#268bd2'},
            \{'ctermfg': 5, 'guifg': '#6c71c4'},
            \{'ctermfg': 1, 'guifg': '#dc322f'},
            \{'ctermfg': 3, 'guifg': '#b58900'},
            \{'ctermfg': 8, 'guifg': '#839496'},
            \{'ctermfg': 7, 'guifg': '#586e75'}]

" localvimrc

let g:localvimrc_ask=0

" ## end of OPAM user-setup addition for vim / base ## keep this line


"autosave
" let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
fun! CWIM()
    let cls = {'{' : '}', '[' : ']', '(' : ')'}
    let opn = {'}' : '{', ']' : '[', ')' : '('}
    let stack = []

    for c in split(getline('.'), '\zs')
        if match('{[(' , c) > -1
            call insert(stack, c)
        elseif match('}])', c) > -1
            call remove(stack, index(stack, opn[c]))
        endif
    endfor

    return len(stack) ? cls[stack[0]] : ''
endfun

inoremap <expr> <C-]> CWIM()
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'cryptoline': { 'left': '(*','right': '*)' } }
au BufRead,BufNewFile *.cl set filetype=cryptoline

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

autocmd FileType vim,tex,coq let b:autoformat_autoindent=0
"coq setting"
autocmd FileType coq call SetCoqOptions()
function SetCoqOptions()
    call coquille#Commands()
    call CoqLaunch()
    map <buffer> <silent> <F7> :CoqUndo<CR>
    map <buffer> <silent> <F8> :CoqNext<CR>
    map <buffer> <silent> <F9> :CoqToCursor<CR>

    imap <buffer> <silent> <F7> <ESC>:CoqUndo<CR>a
    imap <buffer> <silent> <F8> <ESC>:CoqNext<CR>a
    imap <buffer> <silent> <F9> <ESC>:CoqToCursor<CR>a
    let g:coquille_auto_move="true"

endfunction

" ale config
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '⚠'

let g:ale_cpp_gcc_executable='/usr/local/bin/gcc-8'
let g:ale_linters = {'c': ['gcc'], 'cpp': ['g++'], 'python': ['flake8', 'pylint']}

let g:ale_change_sign_column_color=1

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
