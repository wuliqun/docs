# 以NeteaseCloudMusic API 为例

# 安装nodejs
apt install nodejs

# 安装yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt update
apt install yarn
yarn --version 

# 安装pm2
yarn global add pm2

# 获取项目 
mkdir -p /usr/netease && cd /usr/netease
wget https://github.com/Binaryify/NeteaseCloudMusicApi/archive/refs/tags/v4.6.6.zip
unzip v4.6.6.zip && rm v4.6.6.zip

cd Netease*

yarn install

NODE_PORT = 3001 && pm2 start app.js

