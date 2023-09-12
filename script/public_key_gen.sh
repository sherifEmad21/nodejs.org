#! /bin/bash

rm -rf ~/.ssh/*

ssh-keygen -t rsa -b 2048 -C "My SSH Key" -f ~/.ssh/id_rsa -N ""

ssh-keygen -e -f ~/.ssh/id_rsa.pub > ~/.ssh/id_rsa_openSSH.pub


# GEN_PUBLIC_KEY=$(sed '1d;$d' ~/.ssh/id_rsa  | tr -d '\n')

GEN_PUBLIC_KEY=$(sed '1,2d;$d' ~/.ssh/id_rsa_openSSH.pub | tr -d '\n')

echo $GEN_PUBLIC_KEY
sed  -e "s|PUBLIC_KEY|ssh-rsa $GEN_PUBLIC_KEY|g" terraformvar-template.txt > terraform.tfvars

