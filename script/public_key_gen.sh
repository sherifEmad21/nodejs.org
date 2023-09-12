#! /bin/bash

rm -rf ~/.ssh/*

ssh-keygen -t rsa -b 2048 -C "My SSH Key" -f ~/.ssh/id_rsa -N ""

GEN_PUBLIC_KEY=$(sed '1d;$d' ~/.ssh/id_rsa  | tr -d '\n')

cd ../terraform 
echo $GEN_PUBLIC_KEY
sed  -e "s|PUBLIC_KEY|"$GEN_PUBLIC_KEY"|g" terraformvar-template.txt > terraform.tfvars

