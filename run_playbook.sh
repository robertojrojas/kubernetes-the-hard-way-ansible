#!/bin/bash

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false \
    ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s' \
    ansible-playbook -i ./k8s_vms_inventory ./k8s_the_hard_way/k8s_the_hard_way.yml 
