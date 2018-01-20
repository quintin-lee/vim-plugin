" ==========================================================================================
" 配置快捷键
" F2  NERDTree
" F3  TagList
" ==========================================================================================
let mapleader=','
" 配置 F12 生成tags
nmap <F12>      :!ctags --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf -R .<CR>
imap <F12> <ESC>:!ctags --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf -R .<CR>
vmap <F12> <ESC>:!ctags --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf -R .<CR>

" 配置 F11 生成 cscope
nmap <F11>      :!cscope -Rbq<CR>
vmap <F11> <ESC>:!cscope -Rbq<CR>
imap <F11> <ESC>:!cscope -Rbq<CR>

nnoremap <leader>ev :split $MYVIMRC<CR>
" 自动生成注释
nnoremap <leader>dl :DoxLic<CR>
nnoremap <leader>da :DoxAuth<CR>
nnoremap <leader>df :Dox<CR>

" 快速对齐/格式化
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" 对 buffer 操作
nmap <leader>bn   :bn<CR>
nmap <leader>bp   :bp<CR>

" 删除行尾空格和 tab
nmap <leader>dts  :%s/\s\+$//g<CR>

" YCM 插件快捷键
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ==========================================================================================
" Vim plugin manager
" Make sure you use sigle quotes
" ==========================================================================================
call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/luofei614/vim-plug', { 'dir':'~/.vim/my'}
  Plug 'nsf/gocode', { 'rtp': 'vim' }                      " go 语言自动补全守护
  Plug 'tomasr/molokai'                                    " molokai 主题配色
  Plug 'junegunn/vim-easy-align'                           " 快速对齐/格式化
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " 树形目录插件
  Plug 'vim-scripts/taglist.vim'                           " 代码导航工具
  "Plug 'majutsushi/tagbar'                                 " 代码导航工具
  Plug 'L9'                                                " acp 自动补全需要该库
  "Plug 'AutoComplPop'                                      " acp 自动补全插件
  "Plug 'OmniCppComplete'                                   " c++ 补全插件
  Plug 'SuperTab'                                          " 加强 tab 补全功能
  Plug 'vim-airline'                                       " 状态栏插件
  Plug 'Raimondi/delimitMate'                              " 自动补全括号,引号
  Plug 'c.vim'                                             " C-Support 插件
  Plug 'Yggdroot/indentLine'                               " 显示空格符以及缩进标识
  "Plug 'scrooloose/syntastic'                              " 语法检测插件
  Plug 'wakatime/vim-wakatime'                             " 记录编程时间
  Plug 'xterm-color-table.vim'                             " VIM 显示颜色值插件
  Plug 'vim-scripts/DoxyGen-Syntax'                        " 注释高亮插件
  Plug 'pboettch/vim-cmake-syntax'                         " cmake 语法插件
  Plug 'vim-dict'                                          " 词典插件
  Plug 'dkprice/vim-easygrep'                              " vim grep 搜索插件
  Plug 'DoxygenToolkit.vim'                                " 自动生成文件、函数注释插件
  Plug 'scrooloose/nerdcommenter'                          " 批量注释与反注释
  Plug 'incsearch.vim'                                     " 增强 / ? 搜索功能 高亮所有匹配
  Plug 'vim-gitgutter'                                     " git版本控制插件
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'                           " markdown 语法高亮插件
  Plug 'suan/vim-instant-markdown'
  Plug 'instant-markdown.vim'
  Plug 'isnowfy/python-vim-instant-markdown'
  Plug 'Valloric/YouCompleteMe'
  "Plug 'SirVer/ultisnips'
call plug#end()

" ==========================================================================================
" 解决中文乱码
" ==========================================================================================
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  let &termencoding=&encoding
  set fileencodings=utf-8,gbk,ucs-bom,cp936
endif

" ==========================================================================================
set cursorline
set number
set nobackup
set laststatus=2
set cmdheight=1
set showcmd
set showmode
set showmatch
set incsearch
set hlsearch
set autoread
set autowrite
set ambiwidth=double
set t_Co=256
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab
set linebreak
set iskeyword+=_,$,@,%,#,-
set tags+=tags
set tags+=~/.vim/tags/tags
" set cscopequickfix=s-,c-,d-,i-,t-,e-
set nocp
filetype plugin on
set ofu=syntaxcomplete#Complete
"set completeopt=menu,menuone        " 关闭智能补全时的预览窗口
" set foldenable
" set foldmethod=syntax
" set foldlevel=4
" set foldcolumn=0
set backspace=indent,eol,start      " 解决退格键无法删除问题
" ==========================================================================================
let asmsyntax="nasm"

" ==========================================================================================
" 配置主题配色
" ==========================================================================================
colorscheme molokai
let g:molokai_original = 1

" ==========================================================================================
" 高亮配色
" ==========================================================================================
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/	     " 匹配行尾空格
highlight Pmenu    guibg=#303030      guifg=white   ctermbg=236   ctermfg=white
highlight PmenuSel guibg=#00afaf      guifg=white   ctermbg=37    ctermfg=white

" ==========================================================================================
" 配置 airline 插件
" ==========================================================================================
let g:airline_section_warning='%{strftime("%Y-%m-%d %H:%m")}'
let g:airline_theme                             = "molokai"
let g:airline_powerline_fonts                   = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enable      = 0
let g:airline#extensions#whitespace#symbol      = '!'
"let g:airline_left_sep                          = ''
"let g:airline_left_alt_sep                      = ''
let g:airline_left_sep                          = ' '
let g:airline_left_alt_sep                      = '|'
"let g:airline_right_sep                         = ''
"let g:airline_right_alt_sep                     = ''
let g:airline_right_sep                         = ' '
let g:airline_right_alt_sep                     = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

" ==========================================================================================
" 配置 NERDTree 插件
" ==========================================================================================
let NERDChristmasTree     = 0
let NERDTreeWinSize       = 25
let NERDTreeChDirMode     = 2
let NERDTreeIgnore        = ['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos        = "left"
let NERDTreeMinimalUI     = 1
" autocmd VimEnter * nested :NERDTree|wincmd w
map <F2> :NERDTreeToggle<CR>
autocmd BufEnter * if ( winnr('$') == 1 && exists("b:NERDTree")) | q | endif

" ==========================================================================================
" 配置 Taglist 插件
" ==========================================================================================
let Tlist_Show_One_File        = 1
let Tlist_Auto_Update          = 1
let Tlist_WinWidth             = 25
let Tlist_Exit_OnlyWindow      = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window     = 1
let Tlist_Show_Menu            = 1
let Tlist_Enable_Fold_Column   = 1
" autocmd VimEnter * nested :Tlist
map <F3> :TlistToggle<CR>

" 当vim退出时，自动退出 taglist 和 NERDTree
autocmd BufEnter __Tag_List__ nested call Window_Exit_Only_TagList_NERDTree()

function! Window_Exit_Only_TagList_NERDTree()
    if winbufnr(3) == -1 && exists('g:NERDTree') && g:NERDTree.IsOpen()
        if tabpagenr('$') == 1
            bdelete
            quit
        else
            close
        endif
    endif
endfunction

" ==========================================================================================
" 配置自动补全插件
" ==========================================================================================
let g:acp_behaviorKeywordLength = 1
let g:acp_mappingDriven         = 1

let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbb      = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_MayCompleteDot      = 1
let OmniCpp_MayCompleteScope    = 1
let OmniCpp_MayCompleteArrow    = 1
let OmniCpp_SelectFirstItem     = 2
let OmniCpp_LocalSearchDecl     = 1

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
au FileType c   setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType vim setlocal dict+=~/.vim/dict/vim.dict

" ==========================================================================================
" 配置 wakatime 插件
" ==========================================================================================
let g:wakatime_PythonBinary = '/usr/bin/python'

" ==========================================================================================
" indentLine配置
" ==========================================================================================
let g:indentLine_char                = '¦'
let g:indentLine_fileType            = ['c', 'cpp']
let g:indentLine_fileTypeExclude     = ['text', 'sh']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_setColors           = 1
let g:indentLine_color_term          = 236

" ==========================================================================================
" 配置 EasyGrep 插件
" ==========================================================================================
let g:EasyGrepMode           = 2
let g:EasyGrepCommand        = 0
let g:EasyGrepRecursive      = 1
let g:EasyGrepIgnoreCase     = 0
let g:EasyGrepFilesToExclude = "*.bak,*~,cscope.*,*.a,*.o,*.pyc"

" ==========================================================================================
" C-Support 配置
" ==========================================================================================
let g:C_UseTool_cmake   = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:C_Printheader     = "%<%f%h%m%<  %=%{strftime('%x %X')}   SEITE %N"
let g:C_MapLeader       = ';'

" ==========================================================================================
" vim_easy_align 配置
" ==========================================================================================
if !exists('g:easy_align_delimiters')
      let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" ==========================================================================================
" YouCompleteMe 配置
" ==========================================================================================
set completeopt=menu,menuone
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif  " 离开插入模式退出补全预览
" 回车选中
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
"let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_semantic_triggers = {
            \ 'c': ['->', '.', '&', '   ', ' ', '('],
            \ 'cpp': ['->', '.', '&', '::', '   ', ' ', '(']
            \}

" ==========================================================================================
" DoxyGen-Syntax 配置
" ==========================================================================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["snippets", "plugged/ultisnips/UltiSnips"]
" ==========================================================================================
" DoxyGen-Syntax 配置
" ==========================================================================================
" au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

" let g:instant_markdown_autostart = 1
