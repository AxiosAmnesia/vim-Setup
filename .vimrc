"  ____________________________________________________________________________________________________________________________________
" | :::::::::::::::.   :::.    :::.:::.    :::.  :::.   :::.    :::.:: .::::::.     :::      .::.:::.        :  :::::::..     .,-::::: |
" | ;;;;;;;;'''';;`;;  `;;;;,  `;;;`;;;;,  `;;;  ;;`;;  `;;;;,  `;;;,';;;`    `     ';;,   ,;;;' ;;;;;,.    ;;; ;;;;``;;;;  ,;;;'````' |
" |      [[    ,[[ '[[,  [[[[[. '[[  [[[[[. '[[ ,[[ '[[,  [[[[[. '[[  '[==/[[[[,     \[[  .[[/   [[[[[[[, ,[[[[, [[[,/[[['  [[[        |
" |      $$   c$$$cc$$$c $$$ 'Y$c$$  $$$ 'Y$c$$c$$$cc$$$c $$$ 'Y$c$$    '''    $      Y$c.$$"    $$$$$$$$$$$"$$$ $$$$$$c    $$$        |
" |      88,   888   888,888    Y88  888    Y88 888   888,888    Y88   88b    dP       Y88P      888888 Y88" 888o888b "88bo,`88bo,__,o,|
"  ------------------------------------------------------------------------------------------------------------------------------------
"
"links to Plugin data
" -lightline.vim:		https://github.com/itchyny/lightline.vim
" -neocomplcache.vim:		https://github.com/Shougo/neocomplcache.vim.git
" -nerdtree:			https://github.com/scrooloose/nerdtree
" -undotree:			https://github.com/mbbill/undotree
" -vim-autoclose:		https://github.com/Townk/vim-autoclose.git
" -vim-sensible:		https://github.com/tpope/vim-sensible
" -vim-surround:		https://github.com/tpope/vim-surround
" -SearchComplete:		https://github.com/vim-scripts/SearchComplete.git
" -Syntastic			https://github.com/scrooloose/syntastic.git
" -Sparkup			https://github.com/rstacruz/sparkup.git
" -ctrlp.vim 			https://github.com/kien/ctrlp.vim.git

syntax enable					   "enables syntax highlighting 
set number 					   "enables line numbers to be relitive to the cursor
set nowrap					   "disables wrapping of lines by default, to change so text wraps: 'set wrap'
set foldmethod=syntax

						   "Color stuff
let g:solarized_termcolors=256
set background=dark				   "can be set to 'dark' or 'light'
colorscheme solarized				   "name of colorscheme located in ~/.vim/colors/

execute pathogen#infect()
filetype plugin indent on			   "enables use of additional commands based on filetype in ~/.vim/after/ftplugin

						   "Auto completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_at_startup=1		   "enables neocomplcache on startup
let g:neocomplcache_enable_ignore_case=1	   "Ignore UPPER/lower case when inputing
let g:neocomplcache_min_syntax_length=4		   "how long input must be before neocomplcache starts
let g:neocomplcache_enable_auto_select=1	   "auto select first option, enables use of '<CR>' for completion

let g:lightline={'colorscheme': 'solarized_dark'}  "adds colorscheme to info bar
						   "Other decent colorschemes: solarized_light, PaperColor, powerline

						   "NERDTree map to <C-n>, '\'
map <C-n> :NERDTreeToggle<CR>
map \ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Close if only window up
let g:NERDTreeDirArrowExpandable = '>'		   "Changes Expandable  'char' to be en_us friendly
let g:NERDTreeDirArrowCollapsible = '<' 	   "Changes Collapsible 'char' to be en_us friendly
let g:NERDTreeShowBookmarks=1			   "NERDTree will show bookmarks by default
let g:NERDTreeMinimalUI=1			   "Minimalistic UI for cleaner look
autocmd VimEnter * NERDTree | wincmd p 		   "switches foucus to window open instead of NERDTree on toggle

						   "Undotree
map <C-\> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3			   "Layout selected, check docs for more information on this
let g:undotree_SplitWidth = 20			   "Width of window on open
let g:undotree_DiffAutoOpen = 0			   "Set to not open differences on open (In undo tree press 'D')
let g:undotree_SetFocusWhenToggle = 1		   "Set to auto foucus cursor on window open

						   "eazy file  resizing window size to [CTRL] + (h,j,k,l)
if bufwinnr(1)
	map <C-h> <C-W>>
	map <C-l> <C-W><
	map <C-k> <C-W>-
	map <C-j> <C-W>+
endif
						   "maps 'L', 'H' to <C-W> to change windows faster
map L <C-w>l
map H <C-w>h
						   "sparkup Mappings in insert mode
let g:sparkupExecuteMapping = '<c-e>'

						   "Syntastic basic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

						   "Linters selected
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_html_checkers = ['validator']
let g:syntastic_enable_perl_checker = 1

						   "ctrlp key mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.


"To turn off AutoClose fast if needed
map <C-a> :AutoCloseToggle<CR>  
"vim-autoclose"
"	This plugin helps with surrounding input.
"	Example:
"		Typed:  "Hello, (Your name here!
"		Output: "Hello, (Your name here!)"
"
"
"vim-sensible"
"	Plugin of many internal vim settings that help make everything work
"	better together.
"	Note:
"		documentation: ~/.vim/bundle/vim-sensible/README.markdown
"
"vim-surround"
"	Plugin to change "", (), '', <html tags>, ect... really fast;
"	commands:
"		NOTE: 't' for tag_only
"		'cs[matched_char][new_pattern]'		|	"hello"  	->> ( hello )
"		'cst[new_pattern]'    			| 	<b> hello </b>  ->> " hello "
"
"		'ds[matched_pattern]'			| 	"hello"		->> hello
"		'dst'					|	<b> hello </b>  ->> hello
"
"		NOTE: iw 'text object'
"		'ysiw[new_pattern]'			| 	"hello"		->> ""hello""
"		'yss[new_pattern]' 			| 	 wraps whole line is new_pattern
"		'yssb'					| 	 wrap whole line  in ()
"
"		NOTE: in visual mode or visual block select mode.
"		'S'					|	hello 		->> <tag>hello</tag>
"							|	hello 		    <tag>hello</tag>
"							|	hello 		    <tag>hello</tag>
"							|	hello 		    <tag>hello</tag>
"							|	hello 		    <tag>hello</tag>
"
"	Examples:
"		Starting text: "Hello, World!"
"		NOTE: Assuming cursor is between quotes.
"		  Input:  cs"(
"		  Output: ( Hello, World! )
"		  Input:  cs(<b>
"		  Output: <b>Hello, World!</b>
"		  Input:  cst"
"		  Output: "Hello, World!"
"		  Input:  ds"
"		  Output: Hello, World!
"
"		NOTE:   Assuming cursor is on top of the word 'hello'
"		  Input:  ysiw<em>
"		  Output: "<em>Hello</em>, World!"
"		  Input:  dst
"		  Output: "Hello, World!"
"
"
