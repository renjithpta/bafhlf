#!/bin/bash
set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/ubuntu/blockchain-automation-framework/build/config


echo "Running the playbook..."
exec ansible-playbook -vv /home/ubuntu/blockchain-automation-framework/platforms/shared/configuration/site.yaml --inventory-file=/home/ubuntu/blockchain-automation-framework/platforms/shared/inventory/ -e "@/home/ubuntu/blockchain-automation-framework/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3' -e "reset='true'"
