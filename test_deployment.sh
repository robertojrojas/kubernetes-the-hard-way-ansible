#!/bin/bash



NODE_PUBLIC_IP=${1:-192.168.44.21}
NODE_PORT=$(vagrant ssh controller1 -c 'kubectl get svc kuard --no-headers' 2>&1 | head -n 1 | awk '{print $4}' | awk -F: '{print $2}' | cut -d/ -f1)
curl http://${NODE_PUBLIC_IP}:${NODE_PORT}/env/api
