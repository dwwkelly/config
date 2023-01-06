set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" You Complete Me
"let g:ycm_extra_conf_globlist = ['~/*']
let g:ycm_confirm_extra_conf = 1
"let g:ycm_global_ycm_extra_conf = '/home/devin/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf_globlist = ['~/code/*']
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>D :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>i :YcmCompleter GoToImprecise<CR>

let g:ycm_semantic_triggers =  {
   \   'c' : ['->', '.'],
   \   'cpp,objcpp' : ['->', '.', '::'],
   \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
   \   'ruby' : ['.', '::'],
   \ }

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

noremap <Space> <Nop>
let mapleader=' '
set backspace=indent,eol,start " backspace for dummys
set linespace=0 " No extra spaces between rows
set showmatch " show matching brackets/parenthesis
set incsearch " find as you type search
set hlsearch " highlight search terms
set winminheight=0 " windows can be 0 line high
set smartcase " case sensitive when uc present
set wildmenu " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set scrolljump=5 " lines to scroll when cursor leaves screen
set scrolloff=3 " minimum lines to keep above and below cursor
set nofoldenable " don't fold by default
set gdefault " the /g flag on :s substitutions by default
set nolist
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
nmap <leader>c :set cursorcolumn!<CR>
set nowrapscan
syntax on

" remove trailing white space and windows newlines ( ^M )
autocmd FileType conf,c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType make setlocal noexpandtab

""""""""""""""""
"" Misc
""""""""""""""""

" From insert mode use <C-d> to insert the date
inoremap <C-d> <C-R>=strftime("%a %d %b %Y ")<CR>

" Necesary for lots of cool vim things

" This shows what you are typing as a command.
set showcmd
set history=5000

" remove stupid windows newlines if any
set fileformat=unix

" Remap jj to escape in insert mode.
inoremap jj <Esc>

set enc=utf-8

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

compiler gcc

set grepprg=grep\ -nH\ $*

" Line Numbers
set number
set relativenumber
" highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=Black gui=NONE guifg=NONE guibg=NONE
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=Black 
" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermfg=white ctermbg=red
" highlight SignColumn ctermbg=darkgrey
set numberwidth=4

" Dictionary completion!
if has('unix')
    set dictionary=/usr/share/dict/words
endif

function! FlipNumber()
   set number!
   set relativenumber!
endfunction
nnoremap <leader>n :call FlipNumber()<CR>

"""""""""""""""""""""""""""""
"" Formatting
"""""""""""""""""""""""""""""

set autoindent
set smartindent
" Spaces are better than a tab character
set expandtab
set smarttab

" 4 character tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
au FileType python setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4



" 
" 
" packadd minpac
" call minpac#init()
" 
" call minpac#add('k-takata/minpac', {'type': 'opt'})
" 
" call minpac#add('tpope/vim-fugitive')
" call minpac#add('SirVer/ultisnips')
" call minpac#add('honza/vim-snippets')
" call minpac#add('scrooloose/syntastic')
" call minpac#add('Valloric/MatchTagAlways')
" call minpac#add('Valloric/YouCompleteMe')
" call minpac#add('rdnetto/YCM-Generator')
" call minpac#add('nelstrom/vim-visual-star-search')  " Use * to select highlightded word in visual mode
" call minpac#add('rking/ag.vim')
" call minpac#add('dwwkelly/vim-fswitch')
" call minpac#add('christoomey/vim-tmux-navigator')
" call minpac#add('ctrlpvim/ctrlp.vim')
" call minpac#add('majutsushi/tagbar')
" call minpac#add('robbyrussell/oh-my-zsh')
" call minpac#add('vim-airline/vim-airline')
" call minpac#add('vim-airline/vim-airline-themes')
" 
" call minpac#add('nightsense/cosmic_latte')
" 
" " call minpac#add('Lokaltog/vim-easymotion', {'type': 'opt'})
" 
" "call minpac#add('simnalamburt/vim-mundo', {'type': 'opt'})
" "call minpac#add('godlygeek/tabular', {'type': 'opt'})
" "call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
" "call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
" "call minpac#add('tpope/vim-abolish', {'type': 'opt'})
" "call minpac#add('tommcdo/vim-exchange', {'type': 'opt'})
" "call minpac#add('tpope/vim-surround', {'type': 'opt'})
" "call minpac#add('visSum.vim', {'type': 'opt'})
" "call minpac#add('tpope/vim-markdown', {'type': 'opt'})
" 
" " call minpac#add('jalcine/cmake.vim', {'type': 'opt'})
" " call minpac#add('Glench/Vim-Jinja2-Syntax.git', {'type': 'opt'})
" 
" " call minpac#add('altercation/vim-colors-solarized', {'type': 'opt'})
" " call minpac#add('itchyny/lightline.vim', {'type': 'opt'})
" 
" " call minpac#add('altercation/vim-colors-solarized', {'type': 'opt'})
" 
" " filetype plugin indent on
" 
" let g:airline_powerline_fonts = 1
" set rtp+=/usr/local/opt/fzf
" 
" runtime ftplugin/man.vim
" 
" noremap <Space> <Nop>
" let mapleader=' '
" 
" "let g:lightline = {
" "      \ 'colorscheme': 'solarized',
" "      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
" "      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
" "      \ 'mode_map': { 'c': 'NORMAL' },
" "      \ 'active': {
" "      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
" "      \ },
" "      \ 'component_function': {
" "      \   'modified': 'MyModified',
" "      \   'readonly': 'MyReadonly',
" "      \   'fugitive': 'MyFugitive',
" "      \   'filename': 'MyFilename',
" "      \   'fileformat': 'MyFileformat',
" "      \   'filetype': 'MyFiletype',
" "      \   'fileencoding': 'MyFileencoding',
" "      \   'mode': 'MyMode',
" "      \ }
" "      \ }
" 
" function! MyModified()
"    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction
" 
" function! MyReadonly()
"    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\ue0a2" : ''
" endfunction
" 
" function! MyFilename()
"    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"             \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
"             \  &ft == 'unite' ? unite#get_status_string() : 
"             \  &ft == 'vimshell' ? vimshell#get_status_string() :
"             \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"             \ ('' != MyModified() ? ' ' . MyModified() : '')
" endfunction
" 
" function! MyFugitive()
"    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"       let _ = fugitive#head()
"       return strlen(_) ? "\ue0a0"._ : ''
"    endif
"    return ''
" endfunction
" 
" function! MyFileformat()
"    return winwidth(0) > 70 ? &fileformat : ''
" endfunction
" 
" function! MyFiletype()
"    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
" endfunction
" 
" function! MyFileencoding()
"    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
" endfunction
" 
" function! MyMode()
"    return winwidth(0) > 60 ? lightline#mode() : ''
" endfunction
" 
" set encoding=utf-8
" "syntax enable
" syntax on
" 
" """""""""""""""""""""""""""""
" "" UI
" """""""""""""""""""""""""""""
" 
" "  Pmenu – normal item
" "  PmenuSel – selected item
" "  PmenuSbar – scrollbar
" "  PmenuThumb – thumb of the scrollbar
" 
" highlight Pmenu ctermbg=gray guibg=gray
" highlight PmenuSel ctermbg=green guibg=green
" highlight PmenuSbar ctermbg=gray guibg=gray
" highlight PmenuThumb ctermbg=gray guibg=gray
" 
" if has('cmdline_info')
"    set ruler " show the ruler
"    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
"    set showcmd " show partial commands in status line and
"                " selected characters/lines in visual mode
"  endif
" 
" if has('statusline')
"    set laststatus=2
" 
"    " Broken down into easily includeable segments
"    set statusline=%<%f\ " Filename
"    set statusline+=%w%h%m%r                  " Options
"    "set statusline+=%{fugitive#statusline()}  " Git Hotness
"    set statusline+=%{FugitiveStatusline()}
"    set statusline+=\ [%{&ff}/%Y]             " filetype
"    set statusline+=\ [%{getcwd()}]           " current dir
"    set statusline+=\ [ASCII=\%03.3b/Hex=\%02.2B]   " ASCII / Hexadecimal value of char
"    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav  info
" endif
" 
" set backspace=indent,eol,start " backspace for dummys
" set linespace=0 " No extra spaces between rows
" set showmatch " show matching brackets/parenthesis
" set incsearch " find as you type search
" set hlsearch " highlight search terms
" set winminheight=0 " windows can be 0 line high
" set smartcase " case sensitive when uc present
" set wildmenu " show list instead of just completing
" set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
" set scrolljump=5 " lines to scroll when cursor leaves screen
" set scrolloff=3 " minimum lines to keep above and below cursor
" set nofoldenable " don't fold by default
" set gdefault " the /g flag on :s substitutions by default
" set nolist
" set listchars=tab:▸\ ,eol:¬
" nmap <leader>l :set list!<CR>
" nmap <leader>c :set cursorcolumn!<CR>
" set nowrapscan
" 
" 
" " remove trailing white space and windows newlines ( ^M )
" autocmd FileType conf,c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" autocmd FileType make setlocal noexpandtab
" 
" 
" 
" """"""""""""""""""""""""""""""
" "" Plugin Configs
" """"""""""""""""""""""""""""""
" 
" " Easy Motion
" nnoremap <leader>s <Plug>(easymotion-s2)
" nnoremap <leader>t <Plug>(easymotion-t2)
" 
" " You Complete Me
" "let g:ycm_extra_conf_globlist = ['~/*']
" let g:ycm_confirm_extra_conf = 1
" "let g:ycm_global_ycm_extra_conf = '/home/devin/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_extra_conf_globlist = ['~/code/*']
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>D :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>g :YcmCompleter GoTo<CR>
" nnoremap <leader>i :YcmCompleter GoToImprecise<CR>
" 
" let g:ycm_semantic_triggers =  {
"    \   'c' : ['->', '.'],
"    \   'cpp,objcpp' : ['->', '.', '::'],
"    \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
"    \   'ruby' : ['.', '::'],
"    \ }
" 
" " Ultisnips
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" 
" " ctrl p
" let g:ctrlp_use_caching = 1
" let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|class|apk)$'
" 
" " Tagbar
" let g:tagbar_usearrows = 1
" 
" " vim-arduino
" let g:vim_arduino_map_keys = 0
" let g:vim_arduino_library_path = "/usr/bin/arduino"
" let g:vim_arduino_serial_port = "/dev/arduino"
" " nnoremap <leader>ac :call ArduinoCompile()<CR>
" " nnoremap <leader>ad :call ArduinoDeploy()<CR>
" " nnoremap <leader>as :call ArduinoSerialMonitor()<CR>
" 
" 
" " Syntastic
" noremap <leader>S :SyntasticToggleMode<CR>
" let g:syntastic_python_checkers=['pyflakes', 'pep8']
" let g:syntastic_sh_checkers=['checkbashisms']
" let g:syntastic_java_checkers=['javac']
" let g:syntastic_c_checkers=['sparse']
" let g:syntastic_cpp_checkers=['cppcheck']
" let g:syntastic_xml_checkers=['xmllint']
" let g:syntastic_xslt_checkers=['xmllint']
" let g:syntastic_json_checkers=['jsonlint']
" let g:syntastic_go_checkers=['go']
" let g:syntastic_gentoo_metadata_checkers=['xmllint']
" let g:syntastic_html_checkers=['tidy']
" let g:syntastic_matlab_checkers=['mlint']
" let g:syntastic_tex_checkers=['lacheck']
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_enable_ballons = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_c_sparse_post_args=''
" let g:syntastic_python_pep8_args = "--ignore=E702"
" let g:syntastic_check_on_open=0
" let g:syntastic_enable_signs=1
" if isdirectory('/opt/androidSDK/platforms/android-16')
"    let g:syntastic_java_javac_classpath="/opt/androidSDK/platforms/android-16/android.jar"
" endif
" let g:syntastic_java_javac_config_file_enabled=1
" 
" 
" " Tagbar
" nnoremap <silent> <F3> :TagbarToggle<CR>
" 
" " Map the plugins to F<> keys
" map <F4> :GundoToggle<CR>
" 
" " clang-format
" if filereadable("/usr/share/clang/clang-format.py")
"     map <C-I> :pyf /usr/share/clang/clang-format.py<cr>
"     imap <C-I> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
" endif
" 
" 
" 
" """""""""""""""""""""""""""""
" "" Abbreviates and aliases
" """""""""""""""""""""""""""""
" 
" " This will increment/decrement the next number on the current line
" function! AddSubtract(char, back)
"     let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
"     call search(pattern, 'cw' . a:back)
"     execute 'normal! ' . v:count1 . a:char
"     silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
" endfunction
" nnoremap <silent> <Leader>a :<C-u>call AddSubtract("\<C-a>", '')<CR>
" nnoremap <silent> <Leader>A :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
" nnoremap <silent> <Leader>x :<C-u>call AddSubtract("\<C-x>", '')<CR>
" nnoremap <silent> <Leader>X :<C-u>call AddSubtract("\<C-x>", 'b')<CR>
" 
" 
" """"""""""""""""
" "" Misc
" """"""""""""""""
" 
" " From insert mode use <C-d> to insert the date
" inoremap <C-d> <C-R>=strftime("%a %d %b %Y ")<CR>
" 
" " Necesary for lots of cool vim things
" 
" " This shows what you are typing as a command.
" set showcmd
" set history=5000
" 
" " remove stupid windows newlines if any
" set fileformat=unix
" 
" " Remap jj to escape in insert mode.
" inoremap jj <Esc>
" 
" set enc=utf-8
" 
" " Since I use linux, I want this
" let g:clipbrdDefaultReg = '+'
" 
" " When I close a tab, remove the buffer
" set nohidden
" 
" compiler gcc
" 
" set grepprg=grep\ -nH\ $*
" 
" " Line Numbers
" set number
" set relativenumber
" " highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=Black gui=NONE guifg=NONE guibg=NONE
" highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=Black 
" " Enables cursor line position tracking:
" set cursorline
" " Removes the underline causes by enabling cursorline:
" highlight clear CursorLine
" " Sets the line numbering to red background:
" highlight CursorLineNR ctermfg=white ctermbg=red
" " highlight SignColumn ctermbg=darkgrey
" set numberwidth=4
" 
" " Dictionary completion!
" if has('unix')
"     set dictionary=/usr/share/dict/words
" endif
" 
" function! FlipNumber()
"    set number!
"    set relativenumber!
" endfunction
" nnoremap <leader>n :call FlipNumber()<CR>
" 
" """""""""""""""""""""""""""""
" "" Formatting
" """""""""""""""""""""""""""""
" 
" set autoindent
" set smartindent
" " Spaces are better than a tab character
" set expandtab
" set smarttab
" 
" " 4 character tabs
" set shiftwidth=4
" set tabstop=4
" set softtabstop=4
" au FileType python setl shiftwidth=4 tabstop=4 softtabstop=4
" autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
