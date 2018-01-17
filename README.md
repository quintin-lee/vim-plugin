# vim-plugin
vim 配置以及插件安装

1、git clone https://github.com/quintin-lee/vim-plugin.git
2、mv vim-plugin ~/.vim
3、启动 vim
4、输入 :PlugInstall 安装插件
5、修改 taglist 插件实现当 vim 退出时 NERDTree 和 taglist 插件可以自动退出
    找到函数 function! s:Tlist_Window_Exit_Only_Window()
    if winbufnr(2) == -1
	    if tabpagenr('$') == 1
		" Only one tag page is present
		bdelete
		quit
	    else
		" More than one tab page is present. Close only the current
		" tab page
		close
	    endif
    elseif winbufnr(3) == -1 && exists('g:NERDTree')
	    if tabpagenr('$') == 1
		" Only one tag page is present
		bdelete
		quit
	    else
		" More than one tab page is present. Close only the current
		" tab page
		close
	    endif
	endif

