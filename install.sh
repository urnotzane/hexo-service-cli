#!/bin/bash

# log前缀
log_prefix="[hexo-service-cli]"

echo "$log_prefix 设置临时环境变量..."

# hexo仓库地址
export default_blog_git="blog.git"
# 网站文件地址
export blog_dir="/var/blog"
# 网站文件地址
export username=""
# 网站文件地址
export log_prefix=$log_prefix

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

sh +x ./scripts/install_persional_git.sh

sh +x ./scripts/init_hexo_git.sh

# sh +x ./scripts/init_nginx.sh