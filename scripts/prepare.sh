#!/bin/bash

. $(pwd)/var.sh

echo "$log_prefix 设置临时环境变量..."

# hexo仓库地址
export default_blog_git="blog.git"
# 网站文件地址
export blog_dir="/var/blog"