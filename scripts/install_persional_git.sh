#!/bin/bash

# 自动化搭建git仓库

. $(pwd)/scripts/var.sh

sudo apt update -y

sudo apt install git -y

su $username <<EOF
cd ~
mkdir .ssh

# 修改权限，禁用密码登录
chmod 700 .ssh

# 创建密钥文件
echo "" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
EOF

echo "$log_prefix 创建私人git仓库成功！"