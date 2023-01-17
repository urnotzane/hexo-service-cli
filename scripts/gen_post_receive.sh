#!/bin/bash

# 生成post-receive hook

cat > ~/$default_blog_git/hooks/post-receive <<EOF
#!/bin/bash

GIT_REPO=/home/$username/$default_blog_git
PUBLIC_WWW=$blog_dir
TMP_GIT_CLONE=/tmp/blog

rm -rf \$TMP_GIT_CLONE
git clone \$GIT_REPO \$TMP_GIT_CLONE
rm -rf \$PUBLIC_WWW/*
cp -rf \$TMP_GIT_CLONE/* \$PUBLIC_WWW
EOF

echo "$log_prefix 已生成git hook：~/$default_blog_git/hooks/post-receive"