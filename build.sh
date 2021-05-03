#!/usr/bin/env bash
TAG="${1:-test}"

docker build ./ansible-base -t mrscherrycoke/ansible-base:$TAG
docker push mrscherrycoke/ansible-base:$TAG

sed -i "s/:PLACEHOLDER /:$TAG /g" ansible-playbook/Dockerfile
docker build ./ansible-playbook -t mrscherrycoke/ansible-playbook:$TAG
sed -i "s/:$TAG /:PLACEHOLDER /g" ansible-playbook/Dockerfile
