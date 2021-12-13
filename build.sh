#!/usr/bin/env bash

set -e

for VERSION in $(ls -1 ./ansible-base/requirements/); do
  cp ./ansible-base/requirements/$VERSION ./ansible-base/requirements.txt

  for TAG in $VERSION-$(git rev-parse --short HEAD) $VERSION; do

    docker build ./ansible-base -t mrscherrycoke/ansible-base:$TAG
    docker push mrscherrycoke/ansible-base:$TAG

    for IMAGE in ansible-playbook ansible ansible-vault; do

      sed -i "s/:PLACEHOLDER /:$TAG /g" $IMAGE/Dockerfile
      docker build ./$IMAGE -t mrscherrycoke/$IMAGE:$TAG
      sed -i "s/:$TAG /:PLACEHOLDER /g" $IMAGE/Dockerfile
      docker push mrscherrycoke/$IMAGE:$TAG

    done
  done
done
