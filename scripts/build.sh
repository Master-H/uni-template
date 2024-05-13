#!/usr/bin/env bash

set -e
cur=$(pwd)

echo "当前目录: $cur"

echo "node版本: $(node -v) "
echo "npm版本: $(npm -v)"

if [  -d "./output" ]; then
  rm -rf output 
fi


mkdir -p $cur/output/dist-swan

distSwan=${cur}/output/dist-swan

export PATH=$NODEJS_16_10_0_BIN:$PATH

# 进入小程序目录
cd $cur
echo "进入小程序资源目录：$cur"


# 安装依赖

echo "--------------------- 安装依赖--------------------- "

npx yarn install --registry=http://registry.npm.baidu-int.com  


# 清除旧的产物
if [  -d "./dist" ]; then
  rm -rf dist 
fi

# 打包
echo "--------------------- 打包--------------------- "

yarn run build:mp-baidu


# 配合lazyview
baiduSource=${cur}/dist/build/mp-baidu/*

cp -fr $baiduSource $distSwan

cd $cur/output && tar -zcf dist-swan.tar.gz ./dist-swan

echo '--------------------- 编译完成 ---------------------'





