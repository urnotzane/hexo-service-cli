#!/bin/bash

echo "$log_prefix 禁止$username用户登录shell..."
# 修改git用户为不允许登录shell
usermod -s /usr/bin/git-shell $username