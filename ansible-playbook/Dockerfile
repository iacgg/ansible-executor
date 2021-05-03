FROM mrscherrycoke/ansible-base:PLACEHOLDER AS ansible-playbook

COPY ansible-playbook.sh /ansible-playbook.sh
RUN chmod +x /ansible-playbook.sh
ENTRYPOINT ["/ansible-playbook.sh"]
