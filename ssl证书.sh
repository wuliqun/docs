# 准备 
# 服务器 域名 
# 域名解析至服务器IP, 可以ping通

#安装nginx
apt install nginx

#安装acme：
curl https://get.acme.sh | sh
#添加软链接 --> 将acme.sh当作命令使用
ln -s  /root/.acme.sh/acme.sh /usr/local/bin/acme.sh
#切换CA机构： 
acme.sh --set-default-ca --server letsencrypt
#申请证书： 
acme.sh  --issue -d 你的域名 -k ec-256 --webroot  /var/www/html
#安装证书：  即将证书复制到相应目录下
acme.sh --install-cert -d 你的域名 --ecc \
--key-file       /etc/certs/server.key  \
--fullchain-file /etc/certs/server.crt \
--reloadcmd     "systemctl force-reload nginx"