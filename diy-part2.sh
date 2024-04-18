#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
git clone https://github.com/kiddin9/luci-app-dnsfilter package/luic-app-dnsfilter
git clone https://github.com/kingyond/luci-app-accesscontrol-plus package/luci-app-accesscontrol-plus

#rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci
#git clone https://github.com/fw876/helloworld.git -b master package/helloworld
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# Modify default IP
sed -i 's/192.168.15.1/10.0.0.1/g' package/base-files/files/bin/config_generate
