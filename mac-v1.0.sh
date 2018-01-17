#!/bin/bash
#找到路径

yan_path="/Users/fenghaiyan/Library/Containers/com.iqiyi.player/Data/Library/Application Support/"
cd "${yan_path}" && pwd
#文件名称
yan_folder="com.iqiyi.player"
#如果文件存在即删除（爱奇艺的缓存文件）
if [ -d "${yan_folder}" ]; then
	rm -r com.iqiyi.player
	echo "Deleted!"
fi
#查询程序的PID，并退出
pid=$(ps aux | grep 爱奇艺 | grep -v 热聊 | grep -v grep | awk '{print $2}')
echo "爱奇艺的PID是：${pid}"
result= kill -9 ${pid}
#如果程序已被关闭，择重新打开
if [ ${result}==0 ]; then
	echo "Already killed!"
	sleep 2
	open /Applications/爱奇艺-4.22.3-102.app
    echo "Success!"
else
	echo "Doesn't exist!"
fi
