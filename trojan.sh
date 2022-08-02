# 获取trojan https://github.com/p4gefau1t/trojan-go/releases
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip

# 解压至指定目录
unzip -o trojan-go-linux-amd64.zip -d /usr/local/bin/trojan-go

rm -rf trojan-go-linux-amd64.zip


# 设置自启
vim /etc/systemd/system/trojan-go.service
# 添加
[Unit]
Description=Trojan-Go
After=network.target nss-lookup.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/trojan-go/trojan-go -config /usr/local/etc/trojan-go/config.json
Restart=on-failure
RestartSec=15

[Install]
WantedBy=multi-user.target

# 启动服务 
systemctl enable trojan-go

# trojan-go 为可执行文件
# 建立配置文件
mkdir -p /usr/local/etc/trojan-go
vim /usr/local/etc/trojan-go/config.json

{
  "run_type":"server",
  "local_addr":"0.0.0.0",
  "local_port":443,             # 监听本机443端口
  "remote_addr":"127.0.0.1",
  "remote_port":3000,           # 验证失败转发本机3000端口
  "password":["yourf**kingpassword"],
  "ssl":{                       # 证书地址
    "cert":"/etc/certs/server.crt",
    "key":"/etc/certs/server.key",
    "sni":"domain.com"
  }
}


systemctl restart trojan-go