source ~/.vim/bundles.vim

set nocompatible

"basic配置
set go=   "去掉菜单
set number "显示行号
set autoindent "使用对齐格式，也就是把当前行的的对齐格式应该到下一行
set smartindent "依据上面的对齐格式，智能的选择对齐方式
set tabstop=4 "设置tab键为4个空格
set shiftwidth=4 "设置当行之间交错时使用4个空格
set ruler "设置在编辑过程中，在右下角显示光标位置的状态行

"一组快捷键
let g:mapleader = ","  "设置全局快捷键
imap <leader>e <esc> 
map <leader>q :q!<cr>
map <leader>w :w!<cr>
map <leader>ee :e ~/.vimrc<cr>

set nobackup   "不生成备份文件
set noswapfile "不生交换文件
set showmatch  "高亮显示匹配的括号

"在分割窗口的快捷键操作
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

"编码类型
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,latin1
set fileencoding=utf-8

filetype indent on
syntax enable     "开启语法
syntax on

"颜色主题
if has('gui_running')
	colorscheme desert "设置背景颜色 
else
	colorscheme desert256
endif 

" 高亮当前行和列
set cursorline "高亮当前行                                                        
set cursorcolumn "高亮纵向行

" 搜索操作
set incsearch
set ignorecase "忽略大小写
set smartcase
set hlsearch   "高亮搜索的结果

"历史记录
set history=1000
set undoreload=1000

"屏蔽上下左右快捷键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"保存.vimrc 文件就自动加载
autocmd! BufWritePost vimrc source %
autocmd! BufWritePost *.vimrc source ~/.vimrc

"设置字体
set guifont=Monaco:h12

"airline
let g:airline#extensions#tabline#enabled = 1

"NERDTree
map nt :NERDTreeToggle<cr>
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1

"git-vim
set laststatus=2
set statusline=%{GitBranch()}

"emmt-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-J>'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
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

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" SuperTab
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

"选择颜色主题插件
map <leader>sc :SCROLL

"ctrlp
map <leader>o :CtrlP<CR>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'rw'

" Tagbar
nmap tt :TagbarToggle<cr>
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

"仅仅这些文件自动合并tag
"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" 按 tab 自动补全
autocmd FileType html imap <tab> <plug>(emmet-expand-abbr)
autocmd FileType css imap <tab> <plug>(emmet-expand-abbr)

"vimwiki
let g:vimwiki_camel_case = 0 "不要将驼峰式词组作为Wiki词条
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre' "声明可以在wiki里面使用的HTML标签
let g:vimwiki_list = [{
           \ 'path': '~/vimwiki/',
           \ 'path_html': '~/vimwiki/html/',
           \ 'auto_export': 1,}]
let g:vimwiki_list = [{'path': '~/vimwiki/wiki_techno/', 'path_html': '~/vimwiki/wiki_techno/html/', 'template_path': '~/vimwiki/wiki_techno/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1},{'path': '~/vimwiki/wiki_literature/', 'path_html': '~/vimwiki/wiki_literature/html/', 'template_path': '~/vimwiki/wiki_literature/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1}]                                
let g:vimwiki_browsers=['/usr/bin/firefox'] "用firefox来预览wiki

map <F8> :%s/^\(\s*\)</F8>\1'</plug>g<CR>
map <F9> :%s/>\(,\)\?\s*$/\>'\1/g<CR>
map <F10> :%s/>'$/>',/g<CR>
