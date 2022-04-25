#!/bin/bash

cat >$NETIP <<-EOF
uci set network.lan.ipaddr='10.10.10.252'                                    
uci set network.lan.netmask='255.255.255.0'                                 
uci set network.lan.gateway='10.10.10.253'                                                       
uci set network.lan.dns='10.10.10.253 223.5.5.5'  
uci set network.lan.delegate='0' 
uci set dhcp.@dnsmasq[0].filter_aaaa='1'                                                                                            
uci set dhcp.lan.ignore='1'                                                                                                         
uci set system.@system[0].hostname='OpenWrt'                           
EOF

#sed -i 's/luci-theme-bootstrap/luci-theme-infinityfreedom/g' feeds/luci/collections/luci/Makefile       
sed -i "s/OpenWrt /OpenWrt-LEDE $(TZ=UTC-8 date "+%Y-%m-%d") /g" $ZZZ_PATH 
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ_PATH                                                    
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/x86/index.htm                                                    

cat >${GITHUB_WORKSPACE}/Clear <<-EOF
rm -rf config.buildinfo
rm -rf feeds.buildinfo
rm -rf openwrt-x86-64-generic-kernel.bin
rm -rf openwrt-x86-64-generic.manifest
rm -rf openwrt-x86-64-generic-squashfs-rootfs.img.gz
rm -rf sha256sums
rm -rf version.buildinfo
EOF
