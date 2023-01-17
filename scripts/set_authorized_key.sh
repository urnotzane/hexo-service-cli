#!/bin/bash

echo -n "$log_prefix 请输入ssh公钥："
read id_rsa_pub
if [ $id_rsa_pub ]
then
  su $username <<EOF
    echo $id_rsa_pub >> /home/$username/.ssh/authorized_keys
  EOF
fi
