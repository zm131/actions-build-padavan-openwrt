# 是否超频
echo "CONFIG_FIRMWARE_CPU_600MHZ=y" >> .config

################################################################################################
# 因不同型号配置功能不一样，所以先把配置项删除，如果你自己要添加其他的，也要写上删除这一条，切记！！！
################################################################################################
# Default
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR/d" .config            # 删除配置项 dropbear SSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE/d" .config  # 删除配置项 dropbear symmetrica
sed -i "/CONFIG_FIRMWARE_INCLUDE_OPENSSH/d" .config             # 删除配置项 OpenSSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DDNS_SSL/d"  .config           # HTTPS support for DDNS client
sed -i "/CONFIG_FIRMWARE_INCLUDE_HTTPS/d"  .config              # HTTPS support

# C大
sed -i "/CONFIG_FIRMWARE_INCLUDE_MENTOHUST/d" .config    # 删除配置项 MENTOHUST
sed -i "/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT/d" .config   # 删除配置项 SCUTCLIENT
sed -i "/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS/d" .config  # 删除配置项 SS plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_SSSERVER/d" .config     # 删除配置项 SS server
sed -i "/CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER/d" .config # 删除配置项 DNS-FORWARDER
sed -i "/CONFIG_FIRMWARE_INCLUDE_ADBYBY/d" .config       # 删除配置项 adbyby plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_TUNSAFE/d" .config      # 删除配置项 TUNSAFE
sed -i "/CONFIG_FIRMWARE_INCLUDE_ALIDDNS/d" .config      # 删除配置项 阿里 DDNS
sed -i "/CONFIG_FIRMWARE_INCLUDE_SMARTDNS/d" .config     # 删除配置项 smartDns
sed -i "/CONFIG_FIRMWARE_INCLUDE_SRELAY/d" .config       # 删除配置项 srelay 代理
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYY/d" >> .config        # 删除配置项 网易云解锁
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYYBIN/d" >> .config     # 删除配置项 网易云解锁GO版本执行文件（4M多）注意固件超大小

# 3. 添加公共自定义功能，设备单个的到设备 sh文件中添加
######################################################################
# 以下选项是定义你需要的功能（y=集成,n=忽略），重新写入到.config文件
######################################################################

# 科学
echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y" >> .config  # SS plus+
echo "CONFIG_FIRMWARE_INCLUDE_SSSERVER=n" >> .config     # SS server

#  代理
echo "CONFIG_FIRMWARE_INCLUDE_TUNSAFE=n" >> .config      # TUNSAFE
echo "CONFIG_FIRMWARE_INCLUDE_SRELAY=n" >> .config       # srelay
echo "CONFIG_FIRMWARE_INCLUDE_IPT2SOCKS=n" >> .config    # IPT2

# 广告
echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=y" >> .config       # adbyby plus+

# DNS 有关
echo "CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER=n" >> .config # DNS-FORWARDER
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y" >> .config     # smartdns
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNSBIN=y" >> .config  # smartdns二进制文件

# 其他

echo "CONFIG_FIRMWARE_INCLUDE_MENTOHUST=n" >> .config    # MENTOHUST 锐捷认证
echo "CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=n" >> .config   # SCUT校园网客户端

# Default

### Include OpenSSH instead of dropbear. openssl ~1.2MB, openssh ~1.0MB
echo "CONFIG_FIRMWARE_INCLUDE_OPENSSH=n" >> .config

### Include dropbear SSH. ~0.3MB
echo "CONFIG_FIRMWARE_INCLUDE_DROPBEAR=y" >> .config

### Make the dropbear symmetrical ciphers and hashes faster. ~0.06MB
echo "CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE=y" >> .config

### Include HTTPS support for DDNS client. openssl ~1.2MB
echo "CONFIG_FIRMWARE_INCLUDE_DDNS_SSL=y" >> .config

### Include HTTPS support. openssl ~1.2MB
echo "CONFIG_FIRMWARE_INCLUDE_HTTPS=y" >> .config

#网易云解锁
echo "CONFIG_FIRMWARE_INCLUDE_WYY=y" >> .config
#网易云解锁GO版本执行文件（4M多）注意固件超大小
echo "CONFIG_FIRMWARE_INCLUDE_WYYBIN=n" >> .config
