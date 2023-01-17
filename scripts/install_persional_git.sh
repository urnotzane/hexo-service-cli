#!/bin/bash

# 自动化搭建git仓库

. ./var.sh

sudo apt update -y

sudo apt install git -y

echo -n "$log_prefix 请输入要创建的Linux用户名: "
read username
export username=$username

# 创建用户
useradd $username -m -d /home/$username -s /bin/bash
if [ $? -eq 0 ]
then
  echo "$log_prefix 已创建用户$username!"
fi

echo "$log_prefix 为用户$username设置密码"
# 设置密码
passwd $username

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