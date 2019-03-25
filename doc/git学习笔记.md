#Git学习笔记

**git下载**

到官方网站下载，如果下载速度太慢，可以F12找到a标签的href复制到迅雷进行下载，其他外国软件均可参考这个步骤。

##初始化git
我们默认安装的是linux命令的bash，所以适用所有linux命令。在初始化git时，我们首先选择本地仓库的文件夹，右键git bash进入bash页面，执行	git init 命令：

![1](https://i.imgur.com/VKXV3Mz.png)

执行完成后我们的GitTest文件夹中还是空的，我们执行 ls -lA 可以看到：
![2](https://i.imgur.com/1RHBpIQ.png)

在linux中以“.”开头的文件表示隐藏文件。我们看一下.git/里面有什么：
![3](https://i.imgur.com/z1L6KeP.png)

.git目录中放的是本地仓库相关子目录和文件，不能删除和修改。

##设置签名
签名的形式：

	用户名：malaganguo
	密码：suibianqi@xxx.com

签名的作用：区分不同开发人员的身份，且邮箱不做验证。

辨析：这里设置的签名和代码托管中心的账号密码没有任何关系。

设置签名的命令：（优先级采用就近原则）

1. 项目级别/仓库级别：当前本地仓库有效
![2.1](https://i.imgur.com/XWvsSnz.png)
2. 系统用户级别：当前操作系统登录用户范围
	
~~~
git config --global user.name admin
git config --global user.email admin@admin.com
~~~

我们来看一下保存在config中的pro签名：
![2.2](https://i.imgur.com/wo8N9RI.png)

global签名保存在“~”目录中：
![2.3](https://i.imgur.com/Wxj70P2.png)

##基本操作
指令：`git status` 

如果里面没有文件会提示：
~~~
malaganguo@malaganguo MINGW64 /e/workspace/GitTest (master)
$ git status

On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
~~~
###有文件的话会有两种颜色的显示：

**红色**表示未添加到暂存区，需要使用`git add 文件全名`指令；

**绿色**表示已经添加进缓存区，但是没有提交或者已经做了修改，处于此状态的文件需要执行`git commit 文件全名`才能提交。(使用git命令提交并添加注释`git commit -m "注释内容" 文件全名`)
![2.4](https://i.imgur.com/EkclfEf.png)

在执行完`git commit` 命令提交到本地库后会显示提交的信息，master表示当前位置，root-commit表示第一次提交first commit.new file gitnote.md hello.txt是提交时vim首行添加的注释（很显然注释写错了），1 file changed，1 insertion(+)：一个文件变化，新添加一行。

####总结：git操作步骤
①git status 指令查看当前项目仓库的文件的状态

②对于需要git管理的使用 git add 文件全名 添加到git的，此时文件同时存放在git的缓存区中还未提交。

③对于需要提交到git中的文件，我们使用git commit 文件全名来提交文件到git中

##怎样实现版本的前进/后退（版本穿梭）

首先查看git日志，找到需要穿梭的节点  
~~~
git log       查看日志
git log --pretty=online     简洁查看日志
git log --online  缩短简洁显示的hash值
git reflog    可以看到移动到当前版本需要多少步
~~~

![2.5](https://i.imgur.com/grsHjGD.png)

**HEAD是git管理的指针名字，方便我们引用以实现版本前进/回退，版本管理实质上是对指针的操作**

###基于索引值（hash）版本穿梭

![2.6](https://i.imgur.com/W3qsg7U.png)

###使用“^”或“~”回退

`git reset --hard HEAD^^^`后退三个版本，后退几个版本就有几个“^”。
问题是如果后退的太多，就比较难表达了，我们使用“~数字来后退”，`git reset --hard HEAD~3`同样为后退三个版本。

reset明令除了hard参数外还有soft、mixed参数，soft参数仅仅再本地库移动指针，不懂暂存区和工作区；mixed在本地库重置HEAD指针，重置暂存区；hard是三个都改变了

###删除文件并找回

前提：删除前，文件存放时的状态提交到了本地库

操作：`git reset --hard[指针位置]`

###比较文件差异

`git diff 文件全名`将工作区和暂存区进行比较
`git diff 本地库历史版本  文件全名`工作区和历史版本比较

不加文件全名可以进行所有比较

![2.7](https://i.imgur.com/n5eG1QP.png)


##分支开发

提高迭代效率，模块化开发，开发完成后合并主干。某一个分支开发失败不会影响其他分支，方便于SVN的分支。

![3.1](https://i.imgur.com/FyNpn9g.png)

###分支合并

①切换到被合并分支中`git checkout 被合并分支名`
②用`git merge 待合并分支名`

####合并产生冲突

两个分支对同一文件的同一位置做了不同的修改，现在合并时就会产生合并冲突。

冲突的解决办法：


1. 等号前的是当前分支，后面的是合并分支，把不要的版本删除就行了。
2. add
3. 解决完冲突后，文件变成了modified状态，需要commit，不能带文件名，这样才算解决了冲突。

##Hash

hash是一种加密方式。明文转变为秘文。不局限于文本。

##远程github

登录github -> new repository ->复制https的url

###给url起别名
`git remote add origin https://github.com/malaganguo/test225.git` origin就是<a>https://github.com/malaganguo/test225.git</a>的别名
![5.1](https://i.imgur.com/IriOp7u.png)

`git remote -v` 查看托管仓库

###从本地仓库推送到github仓库
`git push origin master` 把master分支推送到origin中

###从网络仓库clone项目

![5.2](https://i.imgur.com/Xf4dHsY.png)

![5.3](https://i.imgur.com/ndQa32C.png)


可以看到，在执行完clone指令后已经再本地复制了一份git项目

#Q&A
	**git 无法添加文件夹下文件**
	
	google后发现可能是该子文件夹下有.git文件夹导致无法上传。
	
	删除子文件夹下.git后，依然无法提交子文件夹下的文件。
	
	继续google，
	
	尝试以下方法：
	
	 git rm --cached directory
	 git add directory
	注：directory为子文件夹的路径。
	但是执行git rm --cached directory时，提示
	
	fatal: Unable to create 'xx/.git/index.lock': File exists.
	执行rm -f xx/.git/index.lock后解决