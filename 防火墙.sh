# 打开/关闭防火墙
ufw enable
ufw disable

# 打开端口
ufw allow 3000
ufw allow 3000/tcp

# 关闭端口
ufw deny 3000
ufw deny 3000/udp

# 重置
ufw reset

# 查看状态
ufw status