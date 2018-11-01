" Created by "Tannan Dudley"
" ::links to Plugin source::
"   - neocomplcache.vim:        https://github.com/Shougo/neocomplcache.vim.git
"   - nerdtree:                 https://github.com/scrooloose/nerdtree
"   - undotree:                 https://github.com/mbbill/undotree
"   - vim-autoclose:            https://github.com/Townk/vim-autoclose.git
"   - vim-sensible:             https://github.com/tpope/vim-sensible
"   - vim-surround:             https://github.com/tpope/vim-surround
"   - vim-css-color:            https://github.com/ap/vim-css-color
"   - vim-trailing-whitespace:  http://github.com/bronson/vim-trailing-whitespace
"   - vim-nerdtree-tabs:        https://github.com/jistr/vim-nerdtree-tabs
"   - vim-airline:
"   - vim-airline-themes:
"
set visualbell

syntax enable                                      "enables syntax highlighting
set number                                         "enables line numbers to be relitive to the cursor
set rnu                                            "rel number
set nowrap                                         "disables wrapping of lines by default, to change so text wraps: 'set wrap'
set expandtab					                   "sets tabs to spaces
set tabstop=4
set shiftwidth=4
set shiftround
let mapleader = ","

nmap <space> viw
nmap - ddp
imap <C--> <Esc>ddpi
imap <c-U> <Esc>
imap <c-U> <Esc>1viwUi
"imap <c-u> <Esc>1viwui
imap <C-d> <Esc>ddi
nmap + ddkP

"when typing 'help', changes to tab help for fast tabbed help pages
:cabbrev help tab help

"Color stuff
"let g:solarized_termcolors = 256
"set background=dark                                "can be set to 'dark' or 'light'
"colorscheme solarized "name of colorscheme located in ~/.vim/colors/
colorscheme dracula

execute pathogen#infect()

"enables use of additional commands based on filetype in ~/.vim/after/ftplugin
filetype plugin indent on
                                                   "Auto completion
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:neocomplcache_enable_at_startup  = 1         "enables neocomplcache on startup
"let g:neocomplcache_enable_smart_case = 1
""let g:neocomplcache_enable_ignore_case = 1         "Ignore UPPER/lower case when inputing
"let g:neocomplcache_min_syntax_length  = 4         "how long input must be before neocomplcache starts
"let g:neocomplcache_enable_auto_close_preview = 0

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:airline_theme                                = 'behelit'
let g:airline_left_sep                             = ' '
let g:airline_right_sep                            = ' '
let g:airline#extensions#tabline#fnamemod          = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#excludes = ['NERD_tree_1']
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#show_splits       = 0
let g:airline#extensions#tabline#show_buffers      = 0
let g:airline#extensions#tabline#show_tab_type     = 0
let g:airline#extensions#tabline#buffer_idx_mode   = 1
let g:airline#extensions#whitespace#enabled        = 0
let g:airline#extensions#wordcount#enabled         = 1
let g:airline#extensions#tabline#show_close_button = 0

"adds switch to tab 1-9 by <leader>(number 1-9)
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"NERDTree map to '\'
map \ :NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Close if only window up
let g:NERDTreeDirArrowExpandable  = '<'            "Changes Expandable  'char' to be en_us friendly
let g:NERDTreeDirArrowCollapsible = '>'            "Changes Collapsible 'char' to be en_us friendly
let g:NERDTreeShowBookmarks       = 1              "NERDTree will show bookmarks by default
let g:NERDTreeMinimalUI           = 1              "Minimalistic UI for cleaner look
autocmd VimEnter * NERDTree | wincmd p             "switches focus to window open instead of NERDTree on toggle


                                                   "Undotree
map <C-\> :UndotreeToggle<CR>
let g:undotree_WindowLayout       = 3              "Layout selected, check docs for more information on this
let g:undotree_SplitWidth         = 20             "Width of window on open
let g:undotree_DiffAutoOpen       = 0              "Set to not open differences on open (In undo tree press 'D')
let g:undotree_SetFocusWhenToggle = 1              "Set to auto foucus cursor on window open

                                                   "eazy file resizing window size to [CTRL] + (h,j,k,l)
if bufwinnr(1)
        map <C-h> <C-W>>
        map <C-l> <C-W><
        map <C-k> <C-W>-
        map <C-j> <C-W>+
endif
                                                   "maps 'L', 'H' to <C-W> to change windows faster
map L <C-w>l
map H <C-w>h
                                                   "Maps <C-a> to toggle autoclose plugin.
                                                   "NOTE: can be useful when needing to paste into terminal in vim
map <c-a> :AutoCloseToggle<CR>

" "-- Plugins that need no configuration -----"
"
"
" "-- vim-autoclose --------------------"
"       This plugin helps with surrounding input.
"       Example:
"               Typed:  "Hello, (Your name here!
"               Output: "Hello, (Your name here!)"
"
" "-- vim-sensible ---------------------"
"       Plugin of many internal vim settings that help make everything work
"       better together.
"       "backspace" - Backspace through anything in insert mode.
"       "incsearch" - Start searching before pressing enter.
"       "listchars" - Makes `:set list` (visible whitespace) prettier.
"       "scrolloff" - Always show at least one line above/below the cursor.
"       Note:
"               documentation: ~/.vim/bundle/vim-sensible/README.markdown
"
" "-- vim-surround ---------------------"
"       Plugin to change "", (), '', <html tags>, ect... really fast;
"       commands:
"               NOTE: 't' for tag_only
"               "cs[matched_char][new_pattern]"         |       "hello"         ->> ( hello )
"               "cst[new_pattern]"                      |       <b> hello </b>  ->> " hello "
"
"               "ds[matched_pattern]"                   |       "hello"         ->> hello
"               "dst"                                   |       <b> hello </b>  ->> hello
"
"               NOTE: iw 'text object'
"               "ysiw[new_pattern]"                     |        hello          ->> "hello"
"               "yss[new_pattern]"                      |        wraps whole line in new_pattern
"               "yssb"                                  |        wraps whole line in ()
"
"       Examples:
"               Starting text: "Hello, World!"
"               NOTE: Assuming cursor is between quotes.
"                 Input:  cs"(
"                 Output: ( Hello, World! )
"                 Input:  cs(<b>
"                 Output: <b>Hello, World!</b>
"                 Input:  cst"
"                 Output: "Hello, World!"
"                 Input:  ds"
"                 Output: Hello, World!
"
"               NOTE:   Assuming cursor is on top of the word 'hello'
"                 Input:  ysiw<em>
"                 Output: "<em>Hello</em>, World!"
"                 Input:  dst
"                 Output: "Hello, World!"
"
" "-- vim-trailing-whitespace ----------"
"
"       this plugin highlights trailing whitespace in red
"       ex:      
"
"       It also adds a function to get rid of it with ":FixWhitespace"
"
" "-- vim-css-color --------------------"
"
"       plugin will highlight hex, rgb, rgba, and key color words like red in
"       their own color
"       examples:
"                   #ffffff
"                   #000000
"                   #3e1e8e
"                   #123456
"                   #111999
"
"
