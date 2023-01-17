#!/bin/bash

. $(pwd)/scripts/var.sh

echo "$log_prefix 设置临时环境变量..."

# hexo仓库地址
export default_blog_git="blog.git"
# 网站文件地址
export blog_dir="/var/blog"

sh +x ./scripts/install_persional_git.sh

sh +x ./scripts/init_hexo_git.sh

# sh +x ./scripts/init_nginx.sh