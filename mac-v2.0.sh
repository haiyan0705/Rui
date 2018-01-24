#!/bin/bash
#作者：Paris
#QQ：1320451952
#说明：持续修改中。。。

#通过传递参数需求，采取相应的操作
pid=$(ps aux | grep 爱奇艺 | grep -v 热聊 | grep -v grep | awk '{print $2}')
startApp() {
	open /Applications/爱奇艺.app
	echo "Start Success!"
}

#打开最新的测试版本
startTestApp() {
	open /Users/fenghaiyan/Desktop/IQiyiAPPs/爱奇艺-4.22.4-102.app
	echo "Start Success!"
}

stopApp() {
	kill -9 ${pid}
	echo "Stop Success!"
}

#清除缓存(注意版本)
clearCache() {
	path="/Users/fenghaiyan/Library/Containers/com.iqiyi.player/Data/Library/Application Support"
	cd "${path}" && pwd
	folder="com.iqiyi.player"
	if [ -d "${folder}" ]; then
		rm -r $folder
		echo "Deleted!"
	fi

	result= kill -9 ${pid}
	#如果程序已被关闭，择重新打开
	if [ ${result}==0 ]; then
		echo "Already killed!"
		sleep 5
		open /Users/fenghaiyan/Desktop/IQiyiAPPs/爱奇艺-4.22.4-102.app
		echo "Clear Cache Success!"
	else
		echo "Doesn't exist!"
	fi

}

#b = Begin, 启动
case $1 in
"b")
	startApp
	;;
esac

#s=Stop，停止
case $1 in
"s")
	stopApp
	;;
esac

#r=Restart，重启
case $1 in
"r")
	stopApp
	startApp
	echo "Restart Success!"
	;;
esac

#c=ClearCache，清除缓存(只能清除爱奇艺app的缓存，别的程序不能实现。)
case $1 in
"c")
	clearCache
	;;
esac

#指定版本，o=Online，线上版本
case $1 in
"o")
	startApp
	;;
esac

#指定版本，t=Test，测试版本
case $1 in
"t")
	startTestApp
	;;
esac
