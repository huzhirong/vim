source ~/.vim/bundles.vim

"basic配置
set go=
set number "显示行号
set autoindent "使用对齐格式，也就是把当前行的的对齐格式应该到下一行
set smartindent "依据上面的对齐格式，智能的选择对齐方式
set tabstop=4 "设置tab键为4个空格
set shiftwidth=4 "设置当行之间交错时使用4个空格
set ruler "设置在编辑过程中，在右下角显示光标位置的状态行
set showmatch "高亮显示匹配的括号
let g:mapleader = ","
imap <leader>e <esc>
map <leader>q :q!<cr>
map <leader>w :w!<cr>
map <leader>ee :e ~/.vimrc<cr>
set nobackup
set noswapfile
set hlsearch

"easier navigation between split windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

"encoding dectection
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,latin1
set fileencoding=utf-8
"set encoding=cp936

"enable filetype dectection and ft specific plugin/indent
filetype indent on

"enable syntax hightlight and completion 
syntax enable
syntax on

"color theme
" color vividchalk
colorscheme desert "设置背景颜色 

" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn
set cursorline "高亮当前行                                                        
set cursorcolumn "高亮纵向行

"search operations
set incsearch
"set highlight  " conflict with highlight current line
set ignorecase
set smartcase

"NERDTree
map nt :NERDTreeToggle<cr>
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1

"git-vim
set laststatus=2
set statusline=%{GitBranch()}

"ZenCoding
let g:user_zen_expandabbr_key='<C-j>'
let g:use_zen_complete_tag = 1
let g:no_html_toolbar = 'yes'
let g:html_tag_case = 'lowercase'

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview


"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
" set conceallevel=2 concealcursor=i
"endif

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

"imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
"imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
"smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

"ino <c-k> <c-r>=TriggerSnippet()<cr>
"snor <c-k> <esc>i<right><c-r>=TriggerSnippet()<cr>

" SuperTab
"let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

"ScrollColors插件
map <leader>sc :SCROLL

"ctrlp
map <leader>o :CtrlP<CR>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'rw'

" Tagbar
" snippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'jjkk
nmap tt :TagbarToggle<cr>
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

"仅仅这些文件自动合并tag
"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"vimwiki
"nmap <F3> :Vimwiki2HTML<cr> "把当前wiki文件生成html
"nmap <F4> :VimwikiAll2HTML<cr> "把所有wiki文件生成html
let g:vimwiki_camel_case = 0 "不要将驼峰式词组作为Wiki词条
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre' "声明可以在wiki里面使用的HTML标签
let g:vimwiki_list = [{
           \ 'path': '/home/cry/vimwiki/',
           \ 'path_html': '/home/cry/vimwiki/html/',
           \ 'auto_export': 1,}]
let g:vimwiki_list = [{'path': '/home/cry/vimwiki/wiki_techno/', 'path_html': '/home/cry/vimwiki/wiki_techno/html/', 'template_path': '/home/cry/vimwiki/wiki_techno/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1},{'path': '/home/cry/vimwiki/wiki_literature/', 'path_html': '/home/cry/vimwiki/wiki_literature/html/', 'template_path': '/home/cry/vimwiki/wiki_literature/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1}]                                
let g:vimwiki_browsers=['/usr/bin/firefox'] "用firefox来预览wiki
