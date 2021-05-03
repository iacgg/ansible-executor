#!/usr/bin/env bash

for TAG in $(git rev-parse --abbrev-ref HEAD) latest ; do

  docker build ./ansible-base -t mrscherrycoke/ansible-base:$TAG
  docker push mrscherrycoke/ansible-base:$TAG
  
  for IMAGE in ansible-playbook ansible ansible-vault; do
  
    sed -i "s/:PLACEHOLDER /:$TAG /g" $IMAGE/Dockerfile
    docker build ./$IMAGE -t mrscherrycoke/$IMAGE:$TAG
    sed -i "s/:$TAG /:PLACEHOLDER /g" $IMAGE/Dockerfile
    docker push mrscherrycoke/$IMAGE:$TAG
  
  done
done
