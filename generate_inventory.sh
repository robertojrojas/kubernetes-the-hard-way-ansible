#!/bin/bash

rm k8s_vms_inventory
k8s_vms=($(vagrant status | grep running | awk '{print $1}'))
for vm in "${k8s_vms[@]}"
do 
  K8S_VM=${vm} 
  echo "generating inventory entry for ${K8S_VM}"
  echo  $(vagrant ssh-config ${K8S_VM} | awk 'NR>1 {print " -o "$1"="$2}') | awk '{print $2 " "  $6 " " $14}' | sed 's/HostName/ansible_ssh_host/; s/Port/ansible_ssh_port/; s/IdentityFile/ansible_ssh_private_key_file/' | xargs echo ${K8S_VM} ansible_user=vagrant >> k8s_vms_inventory 
done

cat >>k8s_vms_inventory<<EOF

[load_balancer]
lb

[main_controller]
controller1

[masters]
controller1
controller2

[nodes]
worker1
worker2

[k8s:children]
load_balancer
masters
nodes

[k8s:vars]
ansible_user=ubuntu 
ansible_ssh_host=127.0.0.1


EOF
