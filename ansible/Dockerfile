FROM debian:buster-slim AS ansible_base

RUN apt-get update && apt-get install uuid-runtime openssh-client python3 python3-pip pkg-config libcairo2-dev libjpeg-dev libgif-dev libgirepository1.0-dev -y && apt-get clean
RUN ln -sf python3 /usr/bin/python
COPY requirements.txt ./
RUN pip3 install --no-cache --upgrade pip setuptools wheel && pip3 install --no-cache --upgrade --ignore-installed -r ./requirements.txt

ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV SSH_AUTH_SOCK=/ssh-agent
WORKDIR /ansible

FROM ansible_base AS ansible-playbook

COPY ansible-playbook.sh /ansible-playbook.sh
RUN chmod +x /ansible-playbook.sh
ENTRYPOINT ["/ansible-playbook.sh"]

FROM ansible_base AS ansible

COPY ansible.sh /ansible.sh
RUN chmod +x /ansible.sh
ENTRYPOINT ["/ansible.sh"]
