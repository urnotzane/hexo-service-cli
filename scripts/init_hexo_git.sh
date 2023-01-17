#!/bin/bash

. $(pwd)/scripts/var.sh

su $username <<EOF
cd ~

# 使用--bare参数初始化仓库，不包含工作区
git init --bare $default_blog_git
EOF

echo -n "请输入网页文件存放目录(绝对路径，默认 $blog_dir): "
read readed_dir

if [ $readed_dir ]; then
    export blog_dir=$readed_dir
fi

# 创建网页文件存放目
mkdir $blog_dir

# git hook地址
hooks_url="/home/$username/$default_blog_git/hooks"
# 复制git hooks，生成一个git push hook
cp $(pwd)/scripts/gen_post_receive.sh $hooks_url/gen_post_receive.sh

# 将网站目录所有权交给新创建的用户
chown -R $username:$username -R $blog_dir

su $username <<EOF
sh -x $hooks_url/gen_post_receive.sh

# 删除复制的hook生成脚本文件
rm -rf $hooks_url/gen_post_receive.sh

# 修改为执行权限
chmod +x $hooks_url/post-receive
EOF

echo "$log_prefix hexo在git仓库中的地址创建成功"