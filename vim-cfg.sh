#!/bin/bash

echo "运行前请先备份好用户根目录下的.vimrc文件和.vim文件夹"
echo "是否继续？[输入Y或y继续，其他则取消]:"
read key
if [[ "${key}" != "Y" ]] && [[ "${key}" != "y" ]]  
then
	echo "操作被取消，结束！！"
	exit 0
fi

#检测是否安装了ctags
runResult=$(whereis ctags)
temp=$(echo $runResult | grep "/")
if [ "${temp}" = "" ]
then
	echo "ctags 没有安装，是否安装？"
	echo "[输入Y或y安装ctags，其他取消]"
	read key
	if [[ ${key} != "Y" ]] && [[ ${key} != "y" ]]
	then
		echo "操作被取消，结束！！"
		exit 0
	fi                   
	echo "安装ctags"
	apt-get update
	apt-get install exuberant-ctags	
else
	echo "检测到ctags已安装"
fi

#检测是否安装了git
runResult=$(whereis git)
temp=$(echo $runResult | grep "/")
if [ "${temp}" = "" ]
then
	echo "git 没有安装，是否安装？"
	echo "[输入Y或y安装git，其他取消]"
	read key
	if [[ ${key} != "Y" ]] && [[ ${key} != "y" ]]
	then
		echo "操作被取消，结束！！"
		exit 0
	fi
	apt-get update
	apt-get install git	
else
	echo "检测到ctags已安装"
fi

#创建目录，用于安装pathogen，插件管理工具
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 同步各类插件
echo "开始进行各类插件安装"
# 左侧的文件结构目录插件nerdtree
echo "安装插件nerdtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# 整个界面的配色插件
echo "安装界面颜色插件"
git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
# 文件搜索插件ctrlp
echo "安装文件搜索插件"
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp























echo "运行结束！"
