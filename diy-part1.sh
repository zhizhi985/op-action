#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# 克隆 OpenClash 源码[reference:5]
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# 克隆 luci-app-mosdns 源码[reference:6]
git clone https://github.com/sbwml/luci-app-mosdns.git package/mosdns
# 克隆 ddns-go 源码[reference:7]
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# 添加iStore软件源
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
#更新Istore的feed
./scripts/feeds update istore
#安装iStore应用商店及依赖
./scripts/feeds install -d y -p istore luci-app-store
