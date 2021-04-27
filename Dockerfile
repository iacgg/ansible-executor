FROM debian:buster-slim

COPY requirements.txt ./
RUN apt update
RUN apt install uuid-runtime openssh-client python3 python3-pip pkg-config libcairo2-dev libjpeg-dev libgif-dev libgirepository1.0-dev -y
RUN ln -sf python3 /usr/bin/python
RUN pip3 install --no-cache --upgrade pip setuptools wheel
RUN pip3 install --no-cache --upgrade --ignore-installed -r ./requirements.txt

ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV SSH_AUTH_SOCK=/ssh-agent

WORKDIR /ansible
