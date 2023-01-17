# hexo-service-cli
自动部署hexo博客站点

## Hexo在私有服务器自动部署指南
### 前置工作
本地电脑生成ssh密钥
```bash
# -C 设置注释文字，比如你的邮箱
ssh-keygen -t rsa -C  'xxx@xxx.com'

# 查看公钥
cat ~/.ssh/id_rsa.pub
```
### 服务器配置

```bash
su
git clone https://github.com/urnotzane/hexo-service-cli.git

cd hexo-service-cli
# 执行安装程序
sh +x ./install.sh
```
根据脚本步骤进行配置:

1. 创建git私人仓库专属用户
