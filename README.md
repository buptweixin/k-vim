k-vim
=======================

# update log
## 2017.12.01
### 使用异步补全工具Completor替代YouCompleteMe
1. Requirements
    - vim8 compiled with python or python3
2. 自动补全列表
    - 文件名[by default]
    - Ultisnips[by default if installed] or neosnippet[completor-neosnippet should has been installed]
    - python
        `pip install jedi`
        `let g:completor_python_binary = '/path/to/python/with/jedi/installed'`
    - cpp [clang should has been installed]
        `let g:completor_clang_binary = '/path/to/clang'`
        `let g:clang_library_path = '/path/to/libclang'`
        每个工程目录下可以新建一个`.clang_complete`文件， 内部指定头文件路径，c++标准等, 下面是一个例子
        ```cpp
        -std=c++11
        -I/Users/maralla/Workspace/src/dji-sdk/Onboard-SDK/lib/inc
        -I/Users/maralla/Workspace/src/dji-sdk/Onboard-SDK/sample/Linux/inc
        ```

## 快捷键合集
### cpp
1. 头文件和源文件跳转
    ```
    Plug 'derekwyatt/vim-fswitch'
    nmap <silent> <Leader>sh :FSHere<cr>

2. 自动生成ctags
    建立` ~/.indexer_files`文件，加入下面的信息:
    ```
    --------------- ~/.indexer_files ---------------
    [foo]
    /data/workplace/foo/src/
    [bar]
    /data/workplace/bar/src/
    `foo` 为工程名，下面的为工程路径
    ```
3. 自动实现接口
    ```
    " ====
    " 由接口快速生成实现框架
    " 写好h文件后在cpp文件中引入头文件，然后使用<leader>PP
    " ====
    Plug 'derekwyatt/vim-protodef'
    ```
### 通用配置
1. syntastic
    语法检查，高亮错误位置，k-vim中使用<leader>s打开错误列表，<leader>sn到下一个错误, <leader>sp到上一个错误

2. 显示buff标签
    命令模式下:bn :bp切换到上一个/下一个buffer, :b`num`跳转到指定编号的buffer

3. 自动检查乱码文件的编码
    使用方法:
     - FencAutoDetect
       自动识别文件编码
     - FencView
       选择指定编码reload文件
    Plug 'adah1972/fencview'

4. Dash.vim
    " Dash.vim
    " :Dash 'keyword' 快速打开Dash并查找api
    " 比如`:Dash cpp:unordered_map`
    Plug 'rizzatti/dash.vim'


5. asyncrun.vim
    " 在后台异步执行， 通过: `cw` 进入quickfix窗口查看结果
    " 异步git push：AsyncRun git push origin master异步编译：AsyncRun gcc % -o %<异步更新 tag：AsyncRun ctags -R --fields=+S .异步 grep：AsyncRun grep -R <cword> .
    Plug 'skywind3000/asyncrun.vim'

6.  一键格式化代码
    Plug 'Chiel92/vim-autoformat'
    nnoremap <F7> :Autoformat<CR>

7. 注释
   quick edit
   快速注释
   <leader>cc 加注释
   <leader>cu 解开注释
   <leader>c<space>  加上/解开注释, 智能判断
   <leader>cy   先复制, 再注解(p可以进行黏贴)
    Plug 'scrooloose/nerdcommenter'

8. 快速对齐
    ```
    " easyalign
    " 快速赋值语句对齐
    " 首先在visual模式下选中文本，然后输入ga接上对其依据，比如`=`
    " vipga=选中段落对齐
    " gaip=`=`第一次出现位置为依据 gaip2=`=`第二次出现位置为依据 gaip*= 所有等号都
    " 对齐
    Plug 'junegunn/vim-easy-align'
    ```
9. 快速移动
    ```
    " quick movement
    " easymotion
    "更高效的移动 [,, + w/fx/h/j/k/l]
    Plug 'Lokaltog/vim-easymotion'
    ```

10. 更高效的行内移动, f/F/t/T, 才触发
    " quickscope
    Plug 'unblevable/quick-scope'

11. 标记
    ```
    " signature
    " 显示marks - 方便自己进行标记和跳转
    " m[a-zA-Z] add mark
    " '[a-zA-Z] go to mark
    " m<Space>  del all marks
    " m/        list all marks
    " m.        add new mark just follow previous mark
    Plug 'kshenoy/vim-signature'
    ```
12. 文件搜索
    ```
    " quick locate file or function
    " 文件搜索
    " change to https://github.com/ctrlpvim/ctrlp.vim
    " ctrlp ctrlpfunky
    " <leader>p 搜索当前文件及其子文件夹下的文件
    " <leader>f 搜索最近打开的文件
    " <leader>fu 在当前文件的函数列表里搜索
    " <leader>fU 搜索当前光标下单词对应的函数
    Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'
    ```
13. 查找单词
    " ctrlsf
    "  `\` 搜索当前光标下的单词
    " 类似sublimetext的搜索
    " In CtrlSF window:
    " 回车/o, 打开
    " t       在tab中打开(建议)
    " T - Lkie t but focus CtrlSF window instead of opened new tab.
    " q - Quit CtrlSF window.
    Plug 'dyng/ctrlsf.vim'

> VERSION: 9.2

> LAST_UPDATE_TIME: 2017-07-29

> 本次更新: 小版本更新, 支持vim8异步语法检查

详细 [更新日志](https://github.com/wklken/k-vim/wiki/UPDATE_LOG)

# 目标

> Just a Better Vim Config. Keep it Simple.


**PS**: 服务器端无插件`k-vim`简化版本(curl直接设置vimrc即可)[vim-for-server](https://github.com/wklken/vim-for-server)

**PPS**: 一份tmux配置 [k-tmux](https://github.com/wklken/k-tmux)

---------------------------------

---------------------------------

# 截图

solarized主题

![solarized](https://github.com/wklken/gallery/blob/master/vim/solarized.png?raw=true)

molokai主题

![molokai](https://github.com/wklken/gallery/blob/master/vim/molokai.png?raw=true)

---------------------------------
---------------------------------

# 安装步骤

### 1. clone 到本地

```
git clone https://github.com/wklken/k-vim.git
```


### 2. 安装依赖包


##### 2.1 系统依赖 # ctags, ag(the_silver_searcher)

```
# ubuntu
sudo apt-get install ctags
sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖
sudo apt-get install silversearcher-ag

# centos
sudo yum install python-devel.x86_64
sudo yum groupinstall 'Development Tools'
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install the_silver_searcher
sudo yum install cmake

# mac
brew install ctags
brew install the_silver_searcher
```

##### 2.2 使用Python

```
sudo pip install flake8 yapf
```

##### 2.3 如果使用Javascript(不需要的跳过)

```
# 安装jshint和jslint,用于javascript语法检查
# 需要nodejs支持,各个系统安装见文档 https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

# ubuntu
sudo apt-get install nodejs npm
sudo npm install -g jslint
sudo npm install jshint -g
sudo npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint

# mac
brew install node
npm install jshint -g
npm install jslint -g
npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint
```


### 3. 安装

```
进入目录, 执行安装
# 注意原先装过的童鞋, 重装时，不要到~/.vim下执行(这是软连接指向k-vim真是目录)，必须到k-vim原生目录执行
# 会进入安装插件的列表，一安装是从github clone的，完全取决于网速, 之后会自动编译 YCM, 编译失败的话需要手动编译, 有问题见YCM文档
# 如果发现有插件安装失败 可以进入vim, 执行`:PlugInstall'

cd k-vim/
sh -x install.sh
```

------------------------
------------------------

# 移除安装

```
cd ~ && rm -rf .vim .vimrc .vimrc.bundles && cd -
```

---------------------------------
---------------------------------

# 常见问题

详见 [wiki](https://github.com/wklken/k-vim/wiki) 以及  [issues](https://github.com/wklken/k-vim/issues)


------------------------
------------------------

# 插件

### 选择安装插件集合

编辑vimrc.bundles中

```
" more options: ['json', 'nginx', 'golang', 'ruby', 'less', 'json', ]
let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
```

选定集合后, 使用插件管理工具进行安装/更新

### 插件管理

使用 [vim-plug](https://github.com/junegunn/vim-plug) 管理插件

`vim-plug` 常见问题: [vim-plug faq](https://github.com/junegunn/vim-plug/wiki/faq) / [YCM timeout](https://github.com/junegunn/vim-plug/wiki/faq#youcompleteme-timeout)
／[YCM 国人在国内做的镜像](https://github.com/LooEv/A-bridge-to-YouCompleteMe)

管理插件的命令

```
:PlugInstall     install                      安装插件
:PlugUpdate      install or update            更新插件
:PlugClean       remove plugin not in list    删除本地无用插件
:PlugUpgrade     Upgrade vim-plug itself      升级本身
:PlugStatus      Check the status of plugins  查看插件状态
```



### 插件列表

说明/演示/自定义快捷键等, 待处理

------------------------
------------------------


# 自定义快捷键

```
注意, 以下 ',' 代表<leader>
1. 可以自己修改vimrc中配置，决定是否开启鼠标

set mouse-=a           " 鼠标暂不启用, 键盘党....
set mouse=a            " 开启鼠标

2. 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
    好处：误删什么的，如果以前屏幕打开，可以找回....惨痛的经历

set t_ti= t_te=

3. 可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认关闭，强迫自己用 hjkl，可以注解
hjkl  上下左右

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

4. 上排F功能键

F1 废弃这个键,防止调出系统帮助
F2 set nu/nonu,行号开关，用于鼠标复制代码用
F3 set list/nolist,显示可打印字符开关
F4 set wrap/nowrap,换行开关
F5 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴
F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示

F9 tagbar
F10 运行当前文件(quickrun)

5. 分屏移动

ctrl + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

6. 搜索
<space> 空格，进入搜索状态
/       同上
,/      去除匹配高亮

(交换了#/* 号键功能, 更符合直觉, 其实是离左手更近)
#       正向查找光标下的词
*       反向查找光标下的词

优化搜索保证结果在屏幕中间

7. tab操作
ctrl+t 新建一个tab

(hjkl)
,th    切第1个tab
,tl    切最后一个tab
,tj    下一个tab
,tk    前一个tab

,tn    下一个tab(next)
,tp    前一个tab(previous)

,td    关闭tab
,te    tabedit
,tm    tabm

,1     切第1个tab
,2     切第2个tab
...
,9     切第9个tab
,0     切最后一个tab

,tt 最近使用两个tab之间切换
(可修改配置位 ctrl+o,  但是ctrl+o/i为系统光标相关快捷键, 故不采用)

8. buffer操作(不建议, 建议使用ctrlspace插件来操作)
[b    前一个buffer
]b    后一个buffer
<-    前一个buffer
->    后一个buffer


9. 按键修改
Y         =y$   复制到行尾
U         =Ctrl-r
,sa       select all,全选
gv        选中并高亮最后一次插入的内容
,v        选中段落
kj        代替<Esc>，不用到角落去按esc了

,q     :q，退出vim
,w     :w, 保存当前文件

ctrl+n    相对/绝对行号切换
<enter>   normal模式下回车选中当前项

更多细节优化:
    1. j/k 对于换行展示移动更友好
    2. HL 修改成 ^$, 更方便在同行移动
    3. ; 修改成 : ，一键进入命令行模式，不需要按shift
    4. 命令行模式 ctrl+a/e 到开始结尾
    5. <和> 代码缩进后自动再次选中, 方便连续多次缩进, esc退出
    6. 对py文件，保存自动去行尾空白，打开自动加行首代码
    7. 'w!!'强制保存, 即使readonly
    8. 去掉错误输入提示
    9. 交换\`和', '能跳转到准确行列位置
    10. python/ruby 等, 保存时自动去行尾空白
    11. 统一所有分屏打开的操作位v/s[nerdtree/ctrlspace] (特殊ctrlp ctrl+v/x)
    12. ',zz' 代码折叠toggle
    13. python使用"""添加docstring会自动补全三引号
    14. Python使用#进行注释时, 自动缩进
```

------------------------
------------------------

### UPDATE_LOG

version 9.2

```
插件部分:
1. 增加 w0rp/ale 异步语法检查插件, 用户vim版本为8.0时自动启用. 非8时, 启用默认scrooloose/syntastic, 两套插件快捷键一致
2. 切换使用flake8作为python风格检查(pip install pep8)
3. 启用yapf作为python代码格式化(pip install yapf)
4. 启用eslint作为javascript代码检查
5. YCM 设置回车选中不再弹补全框

细节:
1. 新增快捷键 gv 选中并高亮最后一次插入的内容
```

### Contributors

thx a lot. 可以给我提pull request:)

查看详情 [git-contributors](https://github.com/wklken/k-vim/graphs/contributors)

### Inspire

1. vimrc文件布局`vimrc+vimrc.bundles`配置方式参考 [maximum-awesome](https://github.com/square/maximum-awesome)

2. install.sh 参考`spf13-vim` 的`bootstrap.sh` [spf13-vim](https://github.com/spf13/spf13-vim)

2. 插件管理使用[Vim-plug](https://github.com/junegunn/vim-plug)

3. 自动补全 [YCM](https://github.com/Valloric/YouCompleteMe)

4. 插件挑选 [VimAwesome](http://vimawesome.com/)

### Resources

[链接](http://www.wklken.me/posts/2014/10/03/vim-resources.html)

### Donation

如果你认为对你有所帮助, You can Buy me a coffee:)


![donation](https://raw.githubusercontent.com/wklken/gallery/master/donation/donation_w.jpg)

------------------------
------------------------

The End!

wklken (凌岳/pythoner/vim党预备党员)

Github: https://github.com/wklken

Blog: [http://www.wklken.me](http://www.wklken.me)

2013-06-11 于深圳


