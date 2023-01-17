#!/bin/bash

. ./var.sh

blog_domain=''

# 安装Nginx
nginx -V || sudo apt install nginx

echo -n "请输入网站域名(不带http和https): "
read domain
if [ $domain ]
then
   blog_domain=$domain
else
    exit '域名不可为空'
fi
echo "$log_prefix 域名：$blog_domain"

# 生成博客网站的Nginx配置文件
./gen_nginx_config.sh $blog_dir $blog_domain

# 启动nginx
service nginx start
if [ $? -eq 0 ]
then
  echo "$log_prefix Nginx启动完成！"
fi