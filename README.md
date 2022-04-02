# AX6-OpenWrt (English & 繁體中文)

#### *** Testing Build. Please do not use in any environment ***
#
#### Redmi AX6 OpenWrt Firmware (LEDE-Lean)

* Management Web Portal: [10.8.31.1](http://10.8.31.1)

* Password: password

* Default Theme: Argon

* Based on [LEDE-Lean](https://github.com/coolsnowwolf/lede)

* Thanks to [coolsnowwolf](https://github.com/coolsnowwolf) & [xiangfeidexiaohuo](https://github.com/xiangfeidexiaohuo)


#### Redmi AX6 Flashing ROM:

* Unlock SSH [Unlock instruction](https://qust.me/post/hong-mi-ax6-jie-suo-ssh-an-zhuang-shi-yong-shellclash-jiao-cheng/)

* Follow Step 1 - 5 [AX6 flash 3rd party OpenWrt Firmware](https://www.right.com.cn/forum/thread-4111331-1-1.html)

* Upload the Factory ROM (UBI format) to router's /tmp folder by SCP:
```
scp AX6-OpenWrt-5.10-factory-20220323_build_${md5}.ubi root@10.8.31.1:/tmp
```

SSH and execute command as below：
```
ubiformat /dev/mtd13 -y -f /tmp/AX6-OpenWrt-5.10-factory-20220323_build_${md5}.ubi

fw_setenv flag_last_success 1

fw_setenv flag_boot_rootfs 1
```
Reboot the router and Enjoy this ROM!

* You can upgrade ROM (BIN format) to latest build on web portal directly (ex. AX6-OpenWrt-5.10-sysupgrade-20220323_build_${md5}.bin)
