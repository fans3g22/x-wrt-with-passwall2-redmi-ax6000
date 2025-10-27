#!/bin/bash
#=================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#=================================================

set -e

# 备份原始 feeds.conf.default
cp feeds.conf.default feeds.conf.default.bak

# 添加额外 feed 源
echo 'src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main' >> feeds.conf.default
echo 'src-git packages_lean https://github.com/coolsnowwolf/lede.git;master' >> feeds.conf.default
if [ ! -d package/adguardhome ]; then
    git clone https://github.com/kongfl888/luci-app-adguardhome.git package/adguardhome
fi


#（可选）查看文件结构用于调试
echo "=== feeds.conf.default 内容 ==="
cat feeds.conf.default
