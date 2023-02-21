# git 秘钥配置

# 生成秘钥
ssh-keygen -t rsa -C "email@abc.com"

# 将.pub绑定到git

# ~/.ssh/config 配置 多个git账号

# mooui
Host mooui.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_mooui_rsa

# github
Host github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_github_rsa
