cd ~/lede
git pull
./scripts/feeds update -a

rm -rf package/AdZero
git clone --depth 1 https://github.com/slobys/AdZero.git package/AdZero

rm -rf package/openwrt-clashoo
git clone --depth 1 https://github.com/kenzok8/openwrt-clashoo.git package/openwrt-clashoo

rm -rf package/luci-app-run
git clone --depth 1 https://github.com/wukongdaily/luci-app-run.git package/luci-app-run

#rm -rf package/luci-app-openclash
#git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf package/v2ray-geodata
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns -b v5 feeds/luci/applications/luci-app-mosdns
git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

./scripts/feeds install -a

make defconfig
make download -j8
make V=s -j$(nproc)
