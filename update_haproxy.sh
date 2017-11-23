#!/bin/bash

KUARD_PORT=$(vagrant ssh controller1 -c 'kubectl get svc kuard --no-headers' 2>&1 | head -n 1 | awk '{print $4}' | awk -F: '{print $2}' | cut -d/ -f1)

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false \
 ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s' \
 ansible-playbook -i k8s_vms_inventory k8s_the_hard_way/update_haproxy.yml -e "kuard_port=${KUARD_PORT}"
