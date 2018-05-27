" author: Wei Xin
" 2018-05-26 18:57
" ==================================================================================
"                                 基本操作
" ==================================================================================
" 更高效的移动 [,, + w/fx/h/j/k/l]
" 更高效的行内移动, f/F/t/T, 才触发
# tab切换
noremap <tab>h :tabfirst<cr>
noremap <tab>l :tablast<cr>
noremap <tab>n :tabnext<cr>
noremap <tab>p :tabprev<cr>
noremap <tab>c :tabclose<cr>
noremap <tab>m :tabm<cr>
noremap <tab>e :tabedit<cr>
" normal模式下切换到确切的tab
noremap <tab>1 1gt
noremap <tab>2 2gt
noremap <tab>3 3gt
noremap <tab>4 4gt
noremap <tab>5 5gt
noremap <tab>6 6gt
noremap <tab>7 7gt
noremap <tab>8 8gt
noremap <tab>9 9gt
noremap <tab>0 :tablast<cr>

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>
# 打开文件浏览器
<m-t>

# 多光标
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
# 快速添加行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
# 将当前行向下或向上移动
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
# 开启绝对和相对行号显示
nnoremap <leader>n :call NumberToggle()<cr>
# 设置对齐方法
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

# 折叠快捷键
<leader>zz
# 文字环绕
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [ 123+4*56 ]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vllllS'     my $str = 'whee!';

" 使用leaderF替代ctrlp
 <c-p> 搜索当前文件及其子文件夹下的文件
 <c-n> 搜索最近打开的文件
 <m-p> 在当前文件的函数列表里搜索
 <m-n>列出buffers
# 跳转到光标下符号的定义方法<c-w]>新窗口打开或者<c-w}>新窗口预览， 少用当前窗口<c-]>
" 找symbol
noremap <silent> <m-j>s :GscopeFind s <C-R><C-W><cr>
" 找定义
noremap <silent> <m-j>g :GscopeFind g <C-R><C-W><cr>
" 找到调用当前函数的所有函数
noremap <silent> <m-j>c :GscopeFind c <C-R><C-W><cr>
" 找到当前textstring
noremap <silent> <m-j>t :GscopeFind t <C-R><C-W><cr>
" 从egrep找
noremap <silent> <m-j>e :GscopeFind e <C-R><C-W><cr>
" 找当前文件
noremap <silent> <m-j>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" 找到include当前文件的所有文件
noremap <silent> <m-j>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" 找到被当前函数调用的函数
noremap <silent> <m-j>d :GscopeFind d <C-R><C-W><cr>
" 找到当前symbol被赋值的位置
noremap <silent> <m-j>a :GscopeFind a <C-R><C-W><cr>


" 自动补全参数快捷键
smap <m-j> <Plug>(complete_parameter#goto_next_parameter)
imap <m-j> <Plug>(complete_parameter#goto_next_parameter)
smap <m-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <m-k> <Plug>(complete_parameter#goto_previous_parameter)


# 复制到系统剪贴板
vnoremap <leader>y "+y

# 自动识别文件编码
noremap <m-f> :FencAutoDetect<cr>

" select all
map <Leader>sa ggVG
" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]


" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

# 自动格式化
nnoremap <F7> :Autoformat<CR>


" signature
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks
" m.        add new mark just follow previous mark

" ctrlsf
"  `\` 搜索当前光标下的单词
" 类似sublimetext的搜索
" In CtrlSF window:
" 回车/o, 打开
" t       在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.

" 增加行文本对象: l   dal yal cil
" 增加文件文本对象: e   dae yae cie
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块

# 错误检查
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <Leader>en <Plug>(ale_next_wrap)
nnoremap <silent> <Leader>ec :ALEToggle<CR>
nnoremap <Leader>s :call ToggleErrors()<cr>

# us
map <leader>us :UltiSnipsEdit<CR>

map <leader><space> :FixWhitespace<cr>


<F10> 打开quickfix


# 编译运行cpp和python
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) python "$(VIM_FILEPATH)"<CR>

# git
nnoremap <m-g> :SignifyToggle<CR>
nnoremap <m-d> :SignifyDiff<CR>
# python 自动排序import
let g:vim_isort_map = '<c-i>'
