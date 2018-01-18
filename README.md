# vim-plugin
## vim 配置以及插件安装

>1、git clone https://github.com/quintin-lee/vim-plugin.git </br>
>2、mv vim-plugin ~/.vim </br>
>3、启动 vim </br>
>4、输入 :PlugInstall 安装插件 </br>
>5、修改 taglist 插件实现当 vim 退出时 NERDTree 和 taglist 插件可以自动退出 </br>
>    找到函数 function! s:Tlist_Window_Exit_Only_Window() </br>
>    if winbufnr(2) == -1 </br>
>	    if tabpagenr('$') == 1 </br>
>		" Only one tag page is present </br>
>		bdelete </br>
>		quit </br>
>	    else </br>
>		" More than one tab page is present. Close only the current </br>
>		" tab page </br>
>		close </br>
>	    endif </br>
>    elseif winbufnr(3) == -1 && exists('g:NERDTree') </br>
>	    if tabpagenr('$') == 1 </br>
>		" Only one tag page is present </br>
>		bdelete </br>
>		quit </br>
>	    else </br>
>		" More than one tab page is present. Close only the current </br>
>		" tab page </br>
>		close </br>
>	    endif </br>
>	endif </br>

