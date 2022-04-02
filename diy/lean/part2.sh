#!/bin/bash
#=================================================
# DIY Part 2 script
#=================================================
              
##Set IP
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##Remove Bootstrap as Default Theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile

##Add Build Information
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='$(date +%Y%m%d) build'/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/zh_cn/en/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/CST-8/HKT-8/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/Shanghai/Hong_Kong/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='.*'/hostname='LMFAO'/g" package/base-files/files/bin/config_generate
sed -i "s/zh-cn/zh-tw/g" package/lean/default-settings/Makefile

##Change NTP Servers
sed -i "s/ntp.server='ntp.aliyun.com'/ntp.server='pool.ntp.org'/g" package/base-files/files/bin/config_generate
sed -i "s/ntp.server='time1.cloud.tencent.com'/ntp.server='hk.pool.ntp.org'/g" package/base-files/files/bin/config_generate
sed -i "/ntp.server='time.ustc.edu.cn'/d" package/base-files/files/bin/config_generate
sed -i "/ntp.server='cn.pool.ntp.org'/d" package/base-files/files/bin/config_generate

##Customize Theme
sed -i "/files\/generic\/cntime/d" feeds/xiangfeidexiaohuo/patch/autocore/Makefile
sed -i "s/cpu_arch=\"?\"/cpu_arch=\"ARMv8 Processor\"/g" feeds/xiangfeidexiaohuo/patch/autocore/files/generic/cpuinfo
sed -i "s/核/ Cores/g" feeds/xiangfeidexiaohuo/patch/autocore/files/generic/cpuinfo
sed -i "s/线程/ Threads/g" feeds/xiangfeidexiaohuo/patch/autocore/files/generic/cpuinfo
sed -i "/qq/d" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "/cntime/d" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/= up_time.*/= sysinfo.uptime or 0,/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/= os.date(.*/= os.date(),/g" feeds/xiangfeidexiaohuo/autocore/files/arm/index.htm
sed -i "s/CPU负载/CPU Usage/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/运行内存/RAM/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/可用数/Free/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/已使用/Buffered/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "/id=\"membuff\"/d" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "s/e.innerHTML = info.uptime;/e.innerHTML = String.format('%t', info.uptime)/g" feeds/xiangfeidexiaohuo/patch/autocore/files/arm/index.htm
sed -i "/trafficbar/d" feeds/xiangfeidexiaohuo/jerrykuku/luci-theme-argon-18.06/htdocs/luci-static/argon/css/cascade.css

##FQ Move to VPN Section
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-passwall/luasrc/view/passwall/server/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/view/vssr/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-openclash/luasrc/view/openclash/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/model/cbi/bypass/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/view/bypass/*.htm


sed -i '/option Interface/d'  package/network/services/dropbear/files/dropbear.config
