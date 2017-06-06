• docker镜像地址
	○ registry.cn-hangzhou.aliyuncs.com/dsy/castmatch
• docker 部署脚本
	○ git@github.com:WTFCode/castmatch_docker.git
• 现在线上部署的工程库
	svn://office.shgamepp.com/cast_release
	需要的话找海哥要账号
• 部署本地环境
	1. 拉取部署脚本库
		§ git clone git@github.com:WTFCode/castmatch_docker.git
		§ cd castmatch_docker
	2. 构建本地镜像
		i. ./launch.sh build
	3. 运行本地镜像
		i. ./launch.sh start
	4. 进入本地docker环境
		i. ./launch.sh attach
	5. 启动基础服务器环境
		i. 启动mysql
		service mysqld start
		ii. 启动tomcat
		service tomcat start
		iii. 本地访问http://localhost:8001/
• FAQ
	○ 运行service出现错误
		§ 因为centos7移除了service命令，现在service是基于systemctl，如果出现错误可能是因为D-Bus没有启动，等一段时间就行，如果还是不行手动重启systemctl
			□ systemctl daemon-reload
	○ docker中的/data目录
		§ castmatch_docker/launch.sh脚本会默认将当前库所属目录(也就是castmatch_docker父目录)挂载为docker镜像的/data目录下的cast_match目录
		
	○ 本地化配置
		§ 工程地址配置
		castmatch_docker/ROOT.xml下
		
		§ 玩家上传的图片数据(本地部署可作为假用户数据方便测试)
		castmatch_docker/upload.xml
		
		* 注意：
		可以将部署工程和upload目录都放到castmatch_docker同级目录下，则不需要做过多配置
	○ war部署
		§ 本地开发的话用war文件部署会比较方便，因为eclipse直接打包出来的是war文件，只需要将工程地址指向编译出来的.war文件即可
