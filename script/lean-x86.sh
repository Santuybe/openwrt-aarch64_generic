sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/TikTok-Router/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/TikTok-Router/g' package/base-files/luci2/bin/config_generate
#sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/lean/defset package/lean/default-settings/files/zzz-default-settings
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore

#下载5g模块
#git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh-cn/modem.po
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh_Hans/modem.po

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone -b 18.06 --depth 1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

#rm -rf package/luci-app-amlogic
#git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
#git clone --depth=1 https://github.com/kiddin9/openwrt-clouddrive2.git  package/clouddrive2
#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

git clone --depth 1 https://github.com/kenzok8/openwrt-packages package/oppkg
mv package/oppkg/luci-app-alist package/luci-app-alist
rm -rf package/oppkg
